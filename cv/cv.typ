// PDF layout of the CV

// section titles
#show heading.where(level: 1): it => block(
  above: 1.3em,
  below: 0.7em,
  text(size: 12pt, weight: "bold", fill: rgb("#0d3b66"), it.body),
)

// description on the left, dates on the right
#let cv-entry(body, date) = block(
  breakable: false,
  below: 1em,
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    body,
    align(right, text(style: "italic", fill: rgb("#0d3b66"), date)),
  ),
)

// links in navy and underlined, as on the website
#show link: it => underline(text(fill: rgb("#0d3b66"), it))