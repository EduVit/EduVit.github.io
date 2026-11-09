-- PDF version: a paragraph that starts with a [date]{.cv-date} becomes cv-entry[text][date] (defined in cv.typ)
function Para(para)
  local date = para.content[1]
  if quarto.doc.is_format("typst") and date and date.t == "Span" and date.classes:includes("cv-date") then
    para.content:remove(1)
    if para.content[1] and para.content[1].t == "Space" then para.content:remove(1) end
    return {pandoc.RawBlock("typst", "#cv-entry["), para, pandoc.RawBlock("typst", "]["), pandoc.Plain(date.content), pandoc.RawBlock("typst", "]")}
  end
end
