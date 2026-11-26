-- Pandoc Lua Filter for Flotix Project Report (Docs-as-Code)
-- Two-pass publication layout engine:
--   Pass 1: Asset path normalization, internal TOC anchors, proportional table widths,
--           semantic table classes (breakable mega-rows, subheaders, keep-together),
--           chapter & section page breaks.
--   Pass 2: Publication-grade semantic figures (no split blockquote captions),
--           dedicated A4 landscape pages for wide diagrams, side-by-side UX spreads
--           (User Personas & Empathy Maps), 2-up screenshot galleries, 2x2 User Flow
--           grid, atomic Bounded Context & Heuristic Problem blocks, compact live-numbered
--           TOC, APA Bibliography hanging indents, and orphan lead-in prevention.

local function make_pagebreak()
  if FORMAT:match("html") then
    return pandoc.RawBlock("html", '<div class="page-break"></div>')
  elseif FORMAT:match("latex") then
    return pandoc.RawBlock("latex", "\\newpage")
  else
    return pandoc.HorizontalRule()
  end
end

local function gfm_slug(s)
  s = pandoc.text.lower(s)
  s = s:gsub("[%.%,%:%;%!%?%(%)%[%]%{%}%'\"%`%/%\\%*%~%&%#%+%=%<%>%|]", "")
  s = s:gsub("^%s+", ""):gsub("%s+$", "")
  s = s:gsub("%s", "-")
  return s
end

local function normalize_asset_src(src)
  if not src then return src end
  while src:sub(1, 3) == "../" do
    src = src:sub(4)
  end
  return src
end

local function rewrite_html_src(text)
  return text:gsub('(src=)(["\'])([^"\']+)(["\'])', function(attr, q1, src, q2)
    return attr .. q1 .. normalize_asset_src(src) .. q2
  end)
end

-- ============================================================================
-- PASS 1: Element-Level Normalization (Images, Links, Tables, Headers)
-- ============================================================================

local function pass1_Div(el)
  if el.identifier and el.identifier:find("__") then
    el.identifier = el.identifier:match("^.*__(.+)$") or el.identifier
  end
  if el.classes:includes("cover-page") then
    return { el, make_pagebreak() }
  end
  return el
end

local function pass1_RawBlock(el)
  if el.text:match("\\newpage") or el.text:match("\\pagebreak") then
    return make_pagebreak()
  end
  if el.format:match("html") and el.text:find("src=") then
    el.text = rewrite_html_src(el.text)
    -- Strip hardcoded HTML width="500" so CSS controls consistent responsive scaling
    el.text = el.text:gsub('%s+width=["\']%d+["\']', '')
  end
  return el
end

local function pass1_Para(el)
  if #el.content == 1 and el.content[1].t == "Str" then
    local txt = el.content[1].text
    if txt == "\\newpage" or txt == "\\pagebreak" then
      return make_pagebreak()
    end
  end
  return el
end

local function pass1_RawInline(el)
  if el.format:match("html") then
    local lower = el.text:lower()
    if lower:match("^<br%s*/?>$") then
      return pandoc.LineBreak()
    end
    if el.text:find("src=") then
      el.text = rewrite_html_src(el.text)
      el.text = el.text:gsub('%s+width=["\']%d+["\']', '')
    end
  end
  return el
end

local function pass1_Image(el)
  el.src = normalize_asset_src(el.src)
  local alt = pandoc.utils.stringify(el.caption)
  local clean_alt, _ = alt:match("^(.-)|(%d+)$")
  if clean_alt then
    el.caption = { pandoc.Str(clean_alt) }
  end
  return el
end

local function pass1_Link(el)
  local gh_anchor = el.target:match("^https://github%.com/[^#]+(#.+)$")
  if gh_anchor then
    el.target = gh_anchor
  elseif not el.target:match("^[a-zA-Z][a-zA-Z0-9+.-]*:") then
    local md_anchor = el.target:match("%.md#(.+)$")
    if md_anchor then
      el.target = "#" .. md_anchor
    end
  end

  if el.target:sub(1, 1) == "#" and el.target:find("__") then
    local anchor = el.target:match("^#.*__(.+)$")
    if anchor then
      el.target = "#" .. anchor
    end
  end
  return el
end

local function extract_headers(el)
  local headers = {}
  if el.head and el.head.rows and #el.head.rows > 0 then
    for _, cell in ipairs(el.head.rows[1].cells) do
      local txt = pandoc.text.lower(pandoc.utils.stringify(cell.contents))
      txt = txt:gsub("^%s+", ""):gsub("%s+$", "")
      table.insert(headers, txt)
    end
  end
  return headers
end

local function table_contains_image_pattern(el, pattern)
  local found = false
  pandoc.walk_block(el, {
    Image = function(img)
      if img.src and img.src:find(pattern) then
        found = true
      end
    end
  })
  return found
end

local function compute_content_widths(el, ncols)
  local weights = {}
  for i = 1, ncols do weights[i] = 6 end

  local function scan_rows(rows)
    for _, row in ipairs(rows) do
      for i, cell in ipairs(row.cells) do
        if i <= ncols then
          local len = #pandoc.utils.stringify(cell.contents)
          if len > weights[i] then
            weights[i] = len
          end
        end
      end
    end
  end

  if el.head and el.head.rows then scan_rows(el.head.rows) end
  if el.bodies then
    for _, body in ipairs(el.bodies) do
      if body.body then scan_rows(body.body) end
    end
  end

  local scores = {}
  local total = 0
  for i = 1, ncols do
    scores[i] = math.sqrt(math.max(weights[i], 4))
    total = total + scores[i]
  end

  local widths = {}
  local min_w = math.min(0.08, 0.7 / ncols)
  local sum = 0
  for i = 1, ncols do
    widths[i] = math.max(min_w, scores[i] / total)
    sum = sum + widths[i]
  end
  for i = 1, ncols do
    widths[i] = widths[i] / sum
  end
  return widths
end

local function match_table_widths(el, headers, ncols)
  local h1 = headers[1] or ""
  local h2 = headers[2] or ""
  local h3 = headers[3] or ""
  local h6 = headers[6] or ""

  -- Cover page table: keep nil so CSS .cover-page table auto-sizes
  if ncols == 2 and h1 == "código" then
    return nil, true, nil
  end

  if ncols == 2 then
    if h1 == "nivel" then return { 0.10, 0.90 }, false, nil end
    if h1:find("^inicio") then return { 0.22, 0.78 }, false, nil end
    if h1 == "descripción" and h2 == "enlace" then return { 0.38, 0.62 }, false, nil end
    if h1 == "método del contrato" then return { 0.36, 0.64 }, false, nil end
    if h1:find("3%. users") then return { 0.50, 0.50 }, false, nil end
    if h1 == "integrantes" then return { 0.27, 0.73 }, false, nil end
    if h1 == "" and h2 == "" then return { 0.21, 0.79 }, false, "table-team-profiles" end
    if h1 == "campo" and h2 == "detalle" then
      if table_contains_image_pattern(el, "entrevista") then
        return { 0.20, 0.80 }, false, "table-interview-card"
      end
      return { 0.23, 0.77 }, false, "table-sprint-planning"
    end
    return { 0.25, 0.75 }, false, nil
  end

  if ncols == 3 then
    if h1:find("criterio") then return { 0.11, 0.59, 0.30 }, false, "table-student-outcome" end
    if h1 == "preguntas" then return { 0.14, 0.28, 0.58 }, false, nil end
    if h1 == "actividad" then return { 0.24, 0.18, 0.58 }, false, nil end
    if h1 == "entrega" then return { 0.11, 0.55, 0.34 }, false, nil end
    if h1 == "team member" then return { 0.26, 0.37, 0.37 }, false, nil end
    if h1:find("^1%.") or h1:find("^6%.") then return { 0.33, 0.34, 0.33 }, false, nil end
  end

  if ncols == 4 then
    if h1 == "versión" then return { 0.08, 0.13, 0.15, 0.64 }, false, nil end
    if h1 == "#" then return { 0.05, 0.46, 0.13, 0.36 }, false, nil end
    if h1 == "repository" and h3 == "commit message" then return { 0.15, 0.21, 0.50, 0.14 }, false, nil end
    if h1 == "repository" and h3 == "committed by" then return { 0.20, 0.34, 0.30, 0.16 }, false, nil end
    if h1 == "team member" then return { 0.25, 0.25, 0.25, 0.25 }, false, nil end
  end

  if ncols == 5 then
    if h1:find("epic") then return { 0.085, 0.135, 0.20, 0.465, 0.115 }, false, "table-user-stories" end
    if h1 == "orden" then return { 0.08, 0.11, 0.21, 0.50, 0.10 }, false, nil end
    if h1 == "" and h2 == "flotix" then return { 0.20, 0.20, 0.20, 0.20, 0.20 }, false, nil end
    if h1 == "segmento" then return { 0.12, 0.19, 0.23, 0.26, 0.20 }, false, nil end
    if h1:find("team member") then return { 0.25, 0.21, 0.18, 0.18, 0.18 }, false, nil end
    if h1 == "repository" then return { 0.15, 0.14, 0.25, 0.33, 0.13 }, false, nil end
    if h1 == "endpoint" then return { 0.19, 0.09, 0.21, 0.21, 0.30 }, false, nil end
  end

  if ncols == 6 then
    if h1:find("team member") then return { 0.21, 0.21, 0.145, 0.145, 0.145, 0.145 }, false, nil end
    if h1 == "user story" or h1 == "bounded context" then return { 0.16, 0.205, 0.275, 0.12, 0.15, 0.09 }, false, nil end
    if h1 == "branch" then return { 0.24, 0.22, 0.14, 0.15, 0.14, 0.11 }, false, nil end
    if h1 == "repository" then return { 0.14, 0.14, 0.10, 0.20, 0.29, 0.13 }, false, nil end
  end

  if ncols == 7 then
    if h1 == "tareas" then return { 0.25, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125 }, false, nil end
  end

  if ncols == 8 then
    if h1 == "story id" then
      if h6:find("assigned") then
        return { 0.07, 0.13, 0.07, 0.13, 0.29, 0.14, 0.10, 0.07 }, false, nil
      else
        return { 0.07, 0.13, 0.07, 0.13, 0.29, 0.10, 0.14, 0.07 }, false, nil
      end
    end
  end

  if ncols == 9 then
    if h1 == "segmento" then
      return { 0.10, 0.13, 0.12, 0.05, 0.09, 0.075, 0.095, 0.165, 0.175 }, false, "table-entrevistas-consolidado"
    end
  end

  return nil, false, nil
end

local function pass1_Table(el)
  local ncols = #el.colspecs
  if ncols == 0 then return el end

  local headers = extract_headers(el)
  local widths, is_cover, extra_cls = match_table_widths(el, headers, ncols)

  if is_cover then
    for i = 1, ncols do
      el.colspecs[i][2] = nil
    end
    return el
  end

  if not widths then
    widths = compute_content_widths(el, ncols)
  end

  for i = 1, ncols do
    el.colspecs[i][2] = widths[i]
  end

  if ncols >= 7 then
    el.classes:insert("table-compact")
  elseif ncols >= 5 then
    el.classes:insert("table-medium")
  end

  if extra_cls then
    el.classes:insert(extra_cls)
    if extra_cls == "table-student-outcome" then
      el.classes:insert("table-breakable")
      -- Split each student/deliverable mega-cell on double LineBreak into atomic .so-entry blocks
      -- so individual lines like "TB2: —" never detach as page-top orphans!
      if el.bodies then
        for _, body in ipairs(el.bodies) do
          for _, row in ipairs(body.body or {}) do
            for ci = 2, #row.cells do
              local cell = row.cells[ci]
              local new_blocks = {}
              for _, blk in ipairs(cell.contents) do
                if blk.t == "Para" or blk.t == "Plain" then
                  local chunk = {}
                  local k = 1
                  while k <= #blk.content do
                    if blk.content[k].t == "LineBreak" and k < #blk.content and blk.content[k + 1].t == "LineBreak" then
                      if #chunk > 0 then
                        table.insert(new_blocks, pandoc.Div({ pandoc.Para(chunk) }, pandoc.Attr("", { "so-entry" })))
                        chunk = {}
                      end
                      k = k + 2
                      while k <= #blk.content and blk.content[k].t == "LineBreak" do
                        k = k + 1
                      end
                    else
                      table.insert(chunk, blk.content[k])
                      k = k + 1
                    end
                  end
                  if #chunk > 0 then
                    table.insert(new_blocks, pandoc.Div({ pandoc.Para(chunk) }, pandoc.Attr("", { "so-entry" })))
                  end
                else
                  table.insert(new_blocks, blk)
                end
              end
              cell.contents = new_blocks
            end
          end
        end
      end
    end
  end

  -- Mark bold section-divider rows (e.g. "Sprint Goal & User Stories") so they never orphan
  local row_count = 0
  local total_chars = 0
  if el.bodies then
    for _, body in ipairs(el.bodies) do
      if body.body then
        for _, row in ipairs(body.body) do
          row_count = row_count + 1
          local c1_txt = ""
          local others_empty = true
          for ci, cell in ipairs(row.cells) do
            local s = pandoc.utils.stringify(cell.contents):gsub("^%s+", ""):gsub("%s+$", "")
            total_chars = total_chars + #s
            if ci == 1 then
              c1_txt = s
            elseif #s > 0 then
              others_empty = false
            end
          end
          if #c1_txt > 0 and others_empty and #row.cells >= 2 then
            row.attr.classes:insert("table-subheader")
          end
        end
      end
    end
  end

  -- Keep genuinely compact tables (<= 6 rows, modest text) intact across page boundaries
  if row_count > 0 and row_count <= 6 and total_chars < 2200
     and extra_cls ~= "table-student-outcome"
     and extra_cls ~= "table-team-profiles" then
    el.classes:insert("table-keep")
  end

  return el
end

local pagebreak_titles = {
  ["registro de versiones del informe"] = true,
  ["project report collaboration insights"] = true,
  ["contenido"] = true,
  ["student outcome"] = true,
  ["bibliografía"] = true,
  ["anexos"] = true,
  -- Strategic clean section breaks (100% A4 Portrait, 1-column)
  ["3.2. impact mapping"] = true,
  ["4.3. landing page ui design"] = true,
  ["4.3.2. landing page mock-up"] = true,
  ["4.4. web applications ux/ui design"] = true,
  ["4.4.2. web applications wireflow diagrams"] = true,
  ["4.4.3. web applications mock-ups"] = true,
  ["4.4.4. web applications user flow diagrams"] = true,
  ["4.5. web applications prototyping"] = true,
  ["4.6. domain-driven software architecture"] = true,
  ["4.6.2. software architecture context diagram"] = true,
  ["4.6.4. software architecture components diagrams"] = true,
  ["4.8. database design"] = true,
  ["5.2.1. sprint 1"] = true,
  ["5.2.1.3. sprint backlog 1"] = true,
  ["5.2.2. sprint 2"] = true,
  ["5.2.2.2. aspect leaders and collaborators"] = true,
  ["5.2.2.8. team collaboration insights during sprint"] = true,
  ["5.2.3. sprint 3"] = true,
  ["5.2.4. sprint 4"] = true,
  ["tareas a evaluar"] = true,
  ["5.4. video about-the-product"] = true,
  ["video about-the-team"] = true,
}

local is_first_heading = true
local prev_heading = ""

local function pass1_Header(el)
  local text = pandoc.utils.stringify(el.content)
  local lower = pandoc.text.lower(text)
  local after_heading = prev_heading
  prev_heading = lower

  local explicit_id = el.identifier:match("^.*__(.+)$")
  local computed_slug = gfm_slug(text)
  if explicit_id and not computed_slug:find(explicit_id, 1, true) then
    el.identifier = explicit_id
  else
    el.identifier = computed_slug
  end

  if lower:match("^capítulo%s+[ivx]+") then
    el.level = 1
  elseif el.level == 1 and lower:match("^2%.[45]%.") then
    el.level = 2
  end

  -- Cada anexo inicia en una página nueva; el primero comparte página con el título "Anexos"
  local is_annex = lower:match("^anexo%s+%a%.") ~= nil and after_heading ~= "anexos"
  local needs_break = pagebreak_titles[lower] or is_annex or (el.level == 1 and not lower:match("^2%.[45]%."))
  if needs_break then
    if is_first_heading then
      is_first_heading = false
      return el
    end
    return { make_pagebreak(), el }
  end

  is_first_heading = false
  return el
end

-- ============================================================================
-- PASS 2: Document-Level Publication Layout Engine (Figures, Spreads, Galleries)
-- ============================================================================

local function is_pagebreak_block(b)
  return b and b.t == "RawBlock" and b.format == "html" and b.text:find('class="page-break"', 1, true) ~= nil
end

local function is_heading_matching(b, pat)
  if not b or b.t ~= "Header" then return false end
  local txt = pandoc.text.lower(pandoc.utils.stringify(b.content))
  return txt:match(pat) ~= nil
end

local function is_bold_leadin_para(b)
  if not b or b.t ~= "Para" then return false end
  -- Single Strong inline (optionally followed by trailing punctuation/spaces), short title-like text
  local non_space = {}
  for _, inl in ipairs(b.content) do
    if inl.t ~= "Space" and inl.t ~= "SoftBreak" then
      table.insert(non_space, inl)
    end
  end
  if #non_space == 1 and non_space[1].t == "Strong" then
    local txt = pandoc.utils.stringify(non_space[1])
    if #txt > 0 and #txt <= 110 and not txt:find("https?://") then
      return true
    end
  end
  -- Also detect "**Sprint #:** Sprint 3" / short colon-ending intro lead-in sentences
  if #non_space >= 2 and non_space[1].t == "Strong" then
    local s1 = pandoc.utils.stringify(non_space[1])
    if s1 == "Sprint #:" then
      return true
    end
  end
  local full = pandoc.utils.stringify(b):gsub("^%s+", ""):gsub("%s+$", "")
  if #full > 0 and #full <= 115 and full:sub(-1) == ":" and not full:find("https?://") then
    return true
  end
  return false
end

local function extract_figure_blockquote(b)
  if not b or b.t ~= "BlockQuote" or #b.content == 0 then
    return nil
  end
  local first = b.content[1]
  if first.t ~= "Para" then return nil end
  local first_txt = pandoc.utils.stringify(first)
  local fig_num_str = first_txt:match("^Figura%s+(%d+)%.")
  if not fig_num_str then return nil end

  local imgs = {}
  for bi = 2, #b.content do
    pandoc.walk_block(b.content[bi], {
      Image = function(img)
        table.insert(imgs, img)
      end
    })
  end
  if #imgs == 0 then return nil end

  return {
    num = tonumber(fig_num_str),
    caption_para = first,
    images = imgs,
  }
end

local function make_single_figure(caption_para, img, extra_class)
  local classes = { "report-figure" }
  if extra_class then
    table.insert(classes, extra_class)
  end
  local cap_div = pandoc.Div({ caption_para }, pandoc.Attr("", { "figure-caption" }))
  local img_para = pandoc.Para({ img })
  return pandoc.Div({ cap_div, img_para }, pandoc.Attr("", classes))
end

local function figure_class_for_num(n)
  -- Tall vertical figures (AR < 0.72) use explicit max-height profiles;
  -- all width-limited figures (AR >= 0.75) default to 100% full Portrait width (180mm)!
  if n >= 4 and n <= 6 then return "figure-persona" end
  if n >= 10 and n <= 12 then return "figure-empathy" end
  if n == 16 then return "figure-impact-1" end
  if n == 19 then return "figure-palette" end
  if n == 20 then return "figure-landing-tall-1" end
  if n == 21 then return "figure-landing-tall-2" end
  return nil
end

local function pop_trailing_pagebreak(out)
  if #out > 0 and is_pagebreak_block(out[#out]) then
    table.remove(out)
  end
end

local function postprocess_blocks(doc)
  local blocks = doc.blocks
  local out = {}
  local i = 1
  local n = #blocks
  local in_bib = false
  local just_saw_contenido = false
  local in_461_general = false

  while i <= n do
    local b = blocks[i]

    -- Track Bibliography H1 section for APA hanging indents
    if b.t == "Header" then
      local lower = pandoc.text.lower(pandoc.utils.stringify(b.content))
      if lower == "bibliografía" then
        table.insert(out, b)
        i = i + 1
        local bib_blocks = {}
        while i <= n do
          local nb = blocks[i]
          if is_pagebreak_block(nb) or (nb.t == "Header" and nb.level == 1) then
            break
          end
          table.insert(bib_blocks, nb)
          i = i + 1
        end
        if #bib_blocks > 0 then
          table.insert(out, pandoc.Div(bib_blocks, pandoc.Attr("", { "bib-block" })))
        end
        goto continue
      end

      if lower == "contenido" then
        just_saw_contenido = true
        table.insert(out, b)
        i = i + 1
        goto continue
      end

      -- Wrap 4.2. Information Architecture in .ia-section (micro-margin trim, exact 10pt font) to absorb 4-line widow
      if lower:match("^4%.2%.%s+information architecture") then
        local ia_blocks = { b }
        i = i + 1
        while i <= n do
          local nb = blocks[i]
          if is_pagebreak_block(nb) or (nb.t == "Header" and nb.level <= 2) then
            break
          end
          -- Apply short-list & lead-in wrapping inside 4.2 cleanly
          if nb.t == "BulletList" and #nb.content >= 2 and #nb.content <= 5 and #pandoc.utils.stringify(nb) < 260 then
            table.insert(ia_blocks, pandoc.Div({ nb }, pandoc.Attr("", { "short-list" })))
          elseif is_bold_leadin_para(nb) then
            table.insert(ia_blocks, pandoc.Div({ nb }, pandoc.Attr("", { "lead-in" })))
          else
            table.insert(ia_blocks, nb)
          end
          i = i + 1
        end
        table.insert(out, pandoc.Div(ia_blocks, pandoc.Attr("", { "ia-section" })))
        goto continue
      end

      if lower:match("^4%.6%.1%.%s+") then
        in_461_general = true
      elseif lower:match("^4%.6%.2%.%s+") then
        in_461_general = false
      end

      -- Group each Heuristic Problem (##### Problema #1..#6 in 5.3.3) atomically and inline h6 labels
      -- ("Problema:" / "Recomendación:") so #2+#3 and #4+#5 fit cleanly 2-per-page at 100% 180mm image width & 10pt font!
      if b.level == 5 and lower:match("^problema%s+#%d+") then
        local prob_blocks = { b }
        i = i + 1
        while i <= n do
          local nb = blocks[i]
          if nb.t == "HorizontalRule" then
            i = i + 1 -- consume divider; CSS border-bottom handles clean separation
            break
          end
          if is_pagebreak_block(nb) or (nb.t == "Header" and nb.level <= 5) then
            break
          end
          if nb.t == "Header" and nb.level == 6 and i + 1 <= n and blocks[i + 1].t == "Para" then
            local lbl = pandoc.utils.stringify(nb.content):gsub("^%s+", ""):gsub("%s+$", "")
            local next_p = blocks[i + 1]
            local merged = { pandoc.Strong({ pandoc.Str(lbl .. ":") }), pandoc.Space() }
            for _, inl in ipairs(next_p.content) do
              table.insert(merged, inl)
            end
            table.insert(prob_blocks, pandoc.Para(merged))
            i = i + 2
          else
            table.insert(prob_blocks, nb)
            i = i + 1
          end
        end
        table.insert(out, pandoc.Div(prob_blocks, pandoc.Attr("", { "heuristic-problem" })))
        goto continue
      end
    end

    -- Wrap TOC BulletList immediately after # Contenido
    if just_saw_contenido and b.t == "BulletList" then
      just_saw_contenido = false
      table.insert(out, pandoc.Div({ b }, pandoc.Attr("", { "toc-block" })))
      i = i + 1
      goto continue
    elseif just_saw_contenido and b.t ~= "RawBlock" then
      just_saw_contenido = false
    end

    -- Check for semantic Figure BlockQuote (> **Figura N.** ... + Image(s))
    local fig = extract_figure_blockquote(b)
    if fig then
      local fn = fig.num

      -- 1. USER PERSONAS (Figuras 4, 5, 6): 100% Portrait 1-column, ALL THREE at maximum 244mm full-page height!
      if fn == 4 or fn == 5 or fn == 6 then
        local block_items = {}
        if #out > 0 and is_heading_matching(out[#out], "^user persona") then
          table.insert(block_items, table.remove(out))
        end
        table.insert(block_items, make_single_figure(fig.caption_para, fig.images[1], "figure-persona"))
        table.insert(out, pandoc.Div(block_items, pandoc.Attr("", { "figure-with-heading" })))
        i = i + 1
        goto continue
      end

      -- 2. USER JOURNEY MAPS (Figuras 7, 8, 9): 100% Portrait 1-column full width (180mm), heading + map atomic, narrative below
      if fn == 7 or fn == 8 or fn == 9 then
        local block_items = {}
        if #out > 0 and is_heading_matching(out[#out], "^user journey map") then
          table.insert(block_items, table.remove(out))
        end
        table.insert(block_items, make_single_figure(fig.caption_para, fig.images[1], nil))
        table.insert(out, pandoc.Div(block_items, pandoc.Attr("", { "figure-with-heading" })))
        i = i + 1
        goto continue
      end

      -- 3. EMPATHY MAPS (Figuras 10, 11, 12): 100% Portrait 1-column maximum-height full plate (244mm!)
      if fn == 10 or fn == 11 or fn == 12 then
        local block_items = {}
        if #out > 0 and is_heading_matching(out[#out], "^mapa de empat") then
          table.insert(block_items, table.remove(out))
        end
        table.insert(block_items, make_single_figure(fig.caption_para, fig.images[1], "figure-empathy"))
        table.insert(out, pandoc.Div(block_items, pandoc.Attr("", { "figure-with-heading" })))
        i = i + 1
        goto continue
      end

      -- 4. IMPACT MAPS (Figuras 16, 17, 18): 100% Portrait 1-column maximum size (Fig 16: 222mm tall; Fig 17 & 18: 100% full width 180mm!)
      if fn == 16 or fn == 17 or fn == 18 then
        local block_items = {}
        if #out > 0 and is_heading_matching(out[#out], "^impact map") then
          table.insert(block_items, table.remove(out))
        end
        local icls = (fn == 16) and "figure-impact-1" or nil
        table.insert(block_items, make_single_figure(fig.caption_para, fig.images[1], icls))
        local wrap_cls = { "figure-with-heading" }
        if fn == 17 then wrap_cls = { "figure-with-heading", "figure-impact-2" }
        elseif fn == 18 then wrap_cls = { "portrait-full-page" } end
        table.insert(out, pandoc.Div(block_items, pandoc.Attr("", wrap_cls)))
        i = i + 1
        goto continue
      end

      -- 5. 10-IMAGE 1-COLUMN 2-UP VERTICAL GALLERIES (Figura 22 Wireframes, Figura 24 Mockups, Figura 26 Prototypes)
      -- Every continuation page renders 2 screens at 100% FULL WIDTH (180x126.6mm)!
      if (fn == 22 or fn == 24 or fn == 26) and #fig.images >= 4 then
        local head_blocks = {}
        while #out > 0 and out[#out].t == "Header" do
          table.insert(head_blocks, 1, table.remove(out))
        end
        local cap_div = pandoc.Div({ fig.caption_para }, pandoc.Attr("", { "gallery-caption" }))
        table.insert(head_blocks, cap_div)
        for idx = 1, math.min(2, #fig.images) do
          table.insert(head_blocks, pandoc.Div({ pandoc.Para({ fig.images[idx] }) }, pandoc.Attr("", { "gallery-img" })))
        end
        local hcls = (fn == 22) and { "gallery-head", "gallery-head-dense" } or { "gallery-head" }
        table.insert(out, pandoc.Div(head_blocks, pandoc.Attr("", hcls)))
        for idx = 3, #fig.images, 2 do
          local pair_blocks = {}
          table.insert(pair_blocks, pandoc.Div({ pandoc.Para({ fig.images[idx] }) }, pandoc.Attr("", { "gallery-img" })))
          if idx + 1 <= #fig.images then
            table.insert(pair_blocks, pandoc.Div({ pandoc.Para({ fig.images[idx + 1] }) }, pandoc.Attr("", { "gallery-img" })))
          end
          table.insert(out, pandoc.Div(pair_blocks, pandoc.Attr("", { "gallery-pair" })))
        end
        i = i + 1
        goto continue
      end

      -- 6. WIREFLOW DIAGRAMS (Figura 23, 3 images): 100% Portrait 1-column, 1 full-width (180mm) vertically balanced page per role!
      if fn == 23 and #fig.images == 3 then
        local p1_blocks = {}
        if #out > 0 and is_heading_matching(out[#out], "^4%.4%.2%.") then
          table.insert(p1_blocks, table.remove(out))
        end
        table.insert(p1_blocks, pandoc.Div({ fig.caption_para }, pandoc.Attr("", { "gallery-caption" })))
        table.insert(p1_blocks, pandoc.Div({ pandoc.Para({ fig.images[1] }) }, pandoc.Attr("", { "gallery-img" })))
        table.insert(out, pandoc.Div(p1_blocks, pandoc.Attr("", { "wireflow-page-first" })))

        for idx = 2, 3 do
          local w_block = { pandoc.Div({ pandoc.Para({ fig.images[idx] }) }, pandoc.Attr("", { "gallery-img" })) }
          table.insert(out, pandoc.Div(w_block, pandoc.Attr("", { "wireflow-page", "wireflow-page-" .. tostring(idx) })))
        end
        i = i + 1
        goto continue
      end

      -- 7. USER FLOW DIAGRAMS (Figura 25, 4 images): 100% Portrait 1-column, 1 Goal + HUGE diagram per page!
      if fn == 25 and #fig.images == 4 then
        local goal_pairs = {}
        for g = 1, 4 do
          if #out >= 2 and out[#out].t == "Para" and out[#out - 1].t == "Div" and out[#out - 1].classes:includes("lead-in") then
            local gtxt = pandoc.utils.stringify(out[#out - 1])
            if gtxt:match("^Goal%s+%d+") then
              local desc = table.remove(out)
              local title = table.remove(out)
              table.insert(goal_pairs, 1, { title, desc })
            else
              break
            end
          else
            break
          end
        end

        if #goal_pairs == 4 then
          -- Adjust stale word "anteriores." in interleaved caption to match 1-goal-per-page presentation
          local clean_cap = pandoc.walk_block(fig.caption_para, {
            Str = function(s)
              if s.text == "anteriores." then
                return pandoc.Str("del rol Administrador.")
              end
              return s
            end
          })
          local cap_div = pandoc.Div({ clean_cap }, pandoc.Attr("", { "gallery-caption" }))
          local p1 = {
            goal_pairs[1][1], goal_pairs[1][2],
            cap_div,
            pandoc.Div({ pandoc.Para({ fig.images[1] }) }, pandoc.Attr("", { "userflow-first" })),
          }
          table.insert(out, pandoc.Div(p1, pandoc.Attr("", { "userflow-page-first" })))

          for g = 2, 4 do
            local pg = {
              goal_pairs[g][1], goal_pairs[g][2],
              pandoc.Div({ pandoc.Para({ fig.images[g] }) }, pandoc.Attr("", { "userflow-item" })),
            }
            table.insert(out, pandoc.Div(pg, pandoc.Attr("", { "userflow-page" })))
          end
        else
          local cap_div = pandoc.Div({ fig.caption_para }, pandoc.Attr("", { "gallery-caption" }))
          for _, gp in ipairs(goal_pairs) do
            table.insert(out, gp[1])
            table.insert(out, gp[2])
          end
          table.insert(out, cap_div)
          for idx = 1, 4 do
            table.insert(out, pandoc.Div({ pandoc.Para({ fig.images[idx] }) }, pandoc.Attr("", { "userflow-item" })))
          end
        end
        i = i + 1
        goto continue
      end

      -- 7b. GENERAL EVENTSTORMING (Figura 27): Vertically balanced full-width plate (180x183.4mm)
      if fn == 27 then
        table.insert(out, pandoc.Div({ make_single_figure(fig.caption_para, fig.images[1], nil) }, pandoc.Attr("", { "figure-solo-plate" })))
        i = i + 1
        goto continue
      end

      -- 8. BOUNDED CONTEXT EVENTSTORMING BLOCKS (Figuras 28..36): Keep BC Title + Description + Full-Width Diagram atomic!
      if fn >= 28 and fn <= 36 then
        local bc_blocks = {}
        if #out > 0 and out[#out].t == "Para" then
          table.insert(bc_blocks, 1, table.remove(out))
        end
        if #out > 0 and (out[#out].t == "Div" and out[#out].classes:includes("lead-in")) then
          table.insert(bc_blocks, 1, table.remove(out))
        elseif #out > 0 and is_bold_leadin_para(out[#out]) then
          table.insert(bc_blocks, 1, table.remove(out))
        end
        table.insert(bc_blocks, make_single_figure(fig.caption_para, fig.images[1], nil))
        table.insert(out, pandoc.Div(bc_blocks, pandoc.Attr("", { "bc-block" })))
        i = i + 1
        goto continue
      end

      -- 9. OO CLASS DIAGRAM (Figura 40): Place full-width diagram directly under 4.7.1 heading (matching 4.6.2-4.6.4 & 4.8.1),
      -- followed by the 9 Bounded Context descriptions at full 10pt prose (eliminates lone 50%-fill plate page!)
      if fn == 40 then
        local oo_items = {}
        while #out > 0 do
          local last = out[#out]
          if last.t == "Header" then break end
          table.insert(oo_items, 1, table.remove(out))
        end
        table.insert(out, make_single_figure(fig.caption_para, fig.images[1], nil))
        if #oo_items > 0 then
          table.insert(out, pandoc.Div(oo_items, pandoc.Attr("", { "oo-bc-list" })))
        end
        i = i + 1
        goto continue
      end

      -- 10. POSTGRESQL DATABASE DIAGRAM (Figura 41): Keep heading + full-width diagram atomic WITHOUT break-after,
      -- and wrap trailing 4.8.1 BC descriptions in .db-bc-section (10pt) so Relaciones entre contextos never spills onto a widow page!
      if fn == 41 then
        local head_blocks = {}
        while #out > 0 and out[#out].t == "Header" do
          table.insert(head_blocks, 1, table.remove(out))
        end
        table.insert(head_blocks, make_single_figure(fig.caption_para, fig.images[1], nil))
        table.insert(out, pandoc.Div(head_blocks, pandoc.Attr("", { "figure-with-heading" })))
        i = i + 1
        local db_prose = {}
        while i <= n do
          local nb = blocks[i]
          if is_pagebreak_block(nb) or (nb.t == "Header" and nb.level <= 2) then
            break
          end
          if is_bold_leadin_para(nb) then
            table.insert(db_prose, pandoc.Div({ nb }, pandoc.Attr("", { "lead-in" })))
          else
            table.insert(db_prose, nb)
          end
          i = i + 1
        end
        if #db_prose > 0 then
          table.insert(out, pandoc.Div(db_prose, pandoc.Attr("", { "db-bc-section" })))
        end
        goto continue
      end

      -- 11. ALL OTHER STANDARD FIGURES (1–3, 13–15, 19–21, 27, 37–39, 42–68): 100% Portrait 1-column full size!
      local cls = figure_class_for_num(fn)
      if #fig.images == 1 then
        table.insert(out, make_single_figure(fig.caption_para, fig.images[1], cls))
      else
        local multi = { pandoc.Div({ fig.caption_para }, pandoc.Attr("", { "figure-caption" })) }
        for _, img in ipairs(fig.images) do
          table.insert(multi, pandoc.Para({ img }))
        end
        table.insert(out, pandoc.Div(multi, pandoc.Attr("", { "report-figure", cls })))
      end
      i = i + 1
      goto continue
    end

    -- Keep short 2-8 item bullet lists intact so 1-item widows (e.g. "Cargando.", "Configuración.") never orphan
    if b.t == "BulletList" and #b.content >= 2 and #b.content <= 8 then
      local ltxt = pandoc.utils.stringify(b)
      if #ltxt < 360 then
        table.insert(out, pandoc.Div({ b }, pandoc.Attr("", { "short-list" })))
        i = i + 1
        goto continue
      end
    end

    -- Bold single-line lead-ins: prevent orphaning at page bottoms globally
    if is_bold_leadin_para(b) then
      table.insert(out, pandoc.Div({ b }, pandoc.Attr("", { "lead-in" })))
      i = i + 1
      goto continue
    end

    table.insert(out, b)
    i = i + 1
    ::continue::
  end

  -- Clean up any duplicate consecutive page breaks or page break immediately before a landscape-page
  local cleaned = {}
  for idx, blk in ipairs(out) do
    if is_pagebreak_block(blk) then
      local prev = cleaned[#cleaned]
      local nxt = out[idx + 1]
      local skip = false
      if prev and (is_pagebreak_block(prev) or (prev.t == "Div" and (prev.classes:includes("portrait-full-page") or prev.classes:includes("landscape-page")))) then
        skip = true
      end
      if nxt and nxt.t == "Div" and (nxt.classes:includes("landscape-page") or nxt.classes:includes("spread-page")) then
        skip = true
      end
      if not skip then
        table.insert(cleaned, blk)
      end
    else
      table.insert(cleaned, blk)
    end
  end

  doc.blocks = cleaned
  return doc
end

return {
  {
    Div = pass1_Div,
    RawBlock = pass1_RawBlock,
    Para = pass1_Para,
    RawInline = pass1_RawInline,
    Image = pass1_Image,
    Link = pass1_Link,
    Table = pass1_Table,
    Header = pass1_Header,
  },
  {
    Pandoc = postprocess_blocks,
  },
}
