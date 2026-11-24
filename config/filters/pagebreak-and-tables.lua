-- Pandoc Lua Filter for Flotix Project Report (Docs-as-Code)
-- Normalizes image paths (Markdown + HTML <img>), Obsidian image widths,
-- internal TOC links, clean page breaks, and chapter headings.

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

  if el.level == 3 and lower:match("^anexo%s+[a-z]%.") then
    is_first_heading = false
    return { make_pagebreak(), el }
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
