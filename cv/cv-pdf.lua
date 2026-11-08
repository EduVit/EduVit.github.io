-- PDF version: each .cv-entry becomes cv-entry[description][date] (defined in cv.typ)
function Div(div)
  if quarto.doc.is_format("typst") and div.classes:includes("cv-entry") then
    local row = pandoc.Blocks({pandoc.RawBlock("typst", "#cv-entry[")})
    row:extend(div.content[1].content)
    row:insert(pandoc.RawBlock("typst", "]["))
    row:extend(div.content[2].content)
    row:insert(pandoc.RawBlock("typst", "]"))
    return row
  end
end
