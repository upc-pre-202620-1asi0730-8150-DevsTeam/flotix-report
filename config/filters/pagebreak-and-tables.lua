-- Pandoc Lua Filter for Flotix Project Report (Docs-as-Code)
-- Normalizes image paths (Markdown + HTML <img>), Obsidian image widths,
-- internal TOC links, clean page breaks, chapter headings, and proportional
-- column widths for every table (overriding Pandoc's dash-count pipe_table widths).

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
  return text:gsub('(src=")((%.%./)+)([^"]+")', '%1%4')
end

function Div(el)
  if el.identifier and el.identifier:find("__") then
    el.identifier = el.identifier:match("^.*__(.+)$") or el.identifier
  end
  if el.classes:includes("cover-page") then
    return { el, make_pagebreak() }
  end
  return el
end

function RawBlock(el)
  if el.text:match("\\newpage") or el.text:match("\\pagebreak") then
    return make_pagebreak()
  end
  if el.format:match("html") and el.text:find("src=") then
    el.text = rewrite_html_src(el.text)
  end
  return el
end

function Para(el)
  if #el.content == 1 and el.content[1].t == "Str" then
    local txt = el.content[1].text
    if txt == "\\newpage" or txt == "\\pagebreak" then
      return make_pagebreak()
    end
  end
  return el
end

function RawInline(el)
  if el.format:match("html") then
    local lower = el.text:lower()
    if lower:match("^<br%s*/?>$") then
      return pandoc.LineBreak()
    end
    if el.text:find("src=") then
      el.text = rewrite_html_src(el.text)
    end
  end
  return el
end

function Image(el)
  el.src = normalize_asset_src(el.src)
  local alt = pandoc.utils.stringify(el.caption)
  local clean_alt, width = alt:match("^(.-)|(%d+)$")
  if clean_alt then
    el.caption = { pandoc.Str(clean_alt) }
    if not el.attributes["width"] then
      el.attributes["style"] = "max-width: min(100%, " .. width .. "px);"
    end
  end
  return el
end

local anchor_aliases = {
  ["#212-estrategias-y-tácticas-frente-a-competidores"] = "#212-estrategias-y-tácticas-frente-a-competidoresestrategias",
  ["#443-web-applications-mock-ups"] = "#442-web-applications-mock-ups",
  ["#444-web-applications-user-flow-diagrams"] = "#443-web-applications-user-flow-diagrams",
}

function Link(el)
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

  if anchor_aliases[el.target] then
    el.target = anchor_aliases[el.target]
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

local function match_table_widths(headers, ncols)
  local h1 = headers[1] or ""
  local h2 = headers[2] or ""
  local h3 = headers[3] or ""
  local h4 = headers[4] or ""
  local h6 = headers[6] or ""

  -- Cover page table: keep nil so CSS .cover-page table auto-sizes
  if ncols == 2 and h1 == "código" then
    return nil, true
  end

  if ncols == 2 then
    if h1 == "nivel" then return { 0.10, 0.90 } end
    if h1 == "descripción" and h2 == "enlace" then return { 0.38, 0.62 } end
    if h1 == "método del contrato" then return { 0.36, 0.64 } end
    if h1:find("3%. users") then return { 0.50, 0.50 } end
    if h1 == "integrantes" then return { 0.27, 0.73 } end
    if h1 == "" and h2 == "" then return { 0.24, 0.76 } end -- 1.1.2 team profiles
    return { 0.25, 0.75 } -- Campo | Detalle / Información
  end

  if ncols == 3 then
    if h1:find("criterio") then return { 0.16, 0.50, 0.34 } end -- Student Outcome
    if h1 == "preguntas" then return { 0.12, 0.28, 0.60 } end -- 5W+2H
    if h1 == "actividad" then return { 0.24, 0.18, 0.58 } end -- 5.1.1 Dev Env
    if h1 == "entrega" then return { 0.10, 0.58, 0.32 } end -- Anexo A
    if h1 == "team member" then return { 0.26, 0.37, 0.37 } end -- S3 insights
    if h1:find("^1%.") or h1:find("^6%.") then return { 0.33, 0.34, 0.33 } end -- Lean UX Canvas
  end

  if ncols == 4 then
    if h1 == "versión" then return { 0.09, 0.11, 0.14, 0.66 } end -- 02-registro-versiones
    if h1 == "#" then return { 0.05, 0.48, 0.11, 0.36 } end -- 5.3.3 Heurísticas resumen
    if h1 == "repository" and h3 == "commit message" then return { 0.15, 0.21, 0.51, 0.13 } end -- S3 commits
    if h1 == "repository" and h3 == "committed by" then return { 0.20, 0.34, 0.30, 0.16 } end -- S2 commits
    if h1 == "team member" then return { 0.25, 0.25, 0.25, 0.25 } end -- S4 insights
  end

  if ncols == 5 then
    if h1:find("epic") then return { 0.08, 0.14, 0.24, 0.44, 0.10 } end -- 3.1 User Stories
    if h1 == "orden" then return { 0.07, 0.10, 0.21, 0.53, 0.09 } end -- 3.3 Product Backlog
    if h1 == "" and h2 == "flotix" then return { 0.20, 0.20, 0.20, 0.20, 0.20 } end -- 2.1 Competidores
    if h1 == "segmento" then return { 0.11, 0.19, 0.24, 0.26, 0.20 } end -- 2.2 Análisis entrevistas
    if h1:find("team member") then return { 0.26, 0.20, 0.18, 0.18, 0.18 } end -- S1 LACX
    if h1 == "repository" then return { 0.15, 0.14, 0.25, 0.34, 0.12 } end -- S1 commits
    if h1 == "endpoint" then return { 0.19, 0.08, 0.21, 0.21, 0.31 } end -- 5.2.x.6 Services Docs
  end

  if ncols == 6 then
    if h1:find("team member") then return { 0.22, 0.18, 0.15, 0.15, 0.15, 0.15 } end -- S2/S3/S4 LACX
    if h1 == "user story" or h1 == "bounded context" then return { 0.18, 0.18, 0.30, 0.11, 0.15, 0.08 } end -- S1/S2 backlog
    if h1 == "branch" then return { 0.25, 0.22, 0.14, 0.15, 0.14, 0.10 } end -- S3 ramas
    if h1 == "repository" then return { 0.14, 0.14, 0.10, 0.20, 0.30, 0.12 } end -- S4 commits
  end

  if ncols == 7 then
    if h1 == "tareas" then return { 0.28, 0.12, 0.12, 0.12, 0.12, 0.12, 0.12 } end -- 2.3.2 User Task Matrix
  end

  if ncols == 8 then
    if h1 == "story id" then
      if h6:find("assigned") then
        -- Sprint 3 Backlog: Story Id | Story Title | Task Id | Task Title | Task Description | Assigned To | Estimation | Status
        return { 0.07, 0.13, 0.07, 0.13, 0.31, 0.14, 0.08, 0.07 }
      else
        -- Sprint 4 Backlog: Story Id | Story Title | Task Id | Task Title | Task Description | Estimation | Assigned To | Status
        return { 0.07, 0.13, 0.07, 0.13, 0.31, 0.08, 0.14, 0.07 }
      end
    end
  end

  if ncols == 9 then
    if h1 == "segmento" then
      -- 2.2 Registro entrevistas: Segmento | Foto | Entrevistado | Edad | Distrito | Duración | Enlace | Herramientas | Principal Dolor
      return { 0.09, 0.10, 0.12, 0.05, 0.09, 0.07, 0.10, 0.18, 0.20 }
    end
  end

  return nil, false
end

function Table(el)
  local ncols = #el.colspecs
  if ncols == 0 then return el end

  local headers = extract_headers(el)
  local widths, is_cover = match_table_widths(headers, ncols)

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
  end

  return el
end

local pagebreak_titles = {
  ["registro de versiones del informe"] = true,
  ["project report collaboration insights"] = true,
  ["tabla de contenido"] = true,
  ["student outcome"] = true,
  ["conclusiones y recomendaciones"] = true,
  ["bibliografía"] = true,
  ["anexos"] = true,
}

local is_first_heading = true

function Header(el)
  local text = pandoc.utils.stringify(el.content)
  local lower = pandoc.text.lower(text)

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

  if lower:match("^5%.1%.%s+software configuration management") then
    local cap5 = pandoc.Header(1, { pandoc.Str("Capítulo V: Product Implementation, Validation & Deployment") },
      pandoc.Attr("capítulo-v-product-implementation-validation--deployment"))
    is_first_heading = false
    return { make_pagebreak(), cap5, el }
  end

  local needs_break = pagebreak_titles[lower] or (el.level == 1 and not lower:match("^2%.[45]%."))
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
