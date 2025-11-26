#let _prepare_stack(sections, gutter, children) = {
  assert.eq(children.named(), (:))
  let children = children.pos()
  let sections = {
    if sections == auto { children.len() * (1fr,) }
    else if type(sections) == int { sections * (1fr,) }
    else { sections }
  }
  (sections, gutter, children)
}

/// a horizontal stack of frames
#let hs(
  columns: auto,
  gutter: 2em,
  ..children,
) = {
  let (columns, gutter, children) = _prepare_stack(columns, gutter, children)
  grid(
    columns: columns,
    rows: (1fr,),
    column-gutter: gutter,
    ..children,
  )
}

/// a horizontal stack of frames
#let vs(
  rows: auto,
  gutter: 2em,
  ..children,
) = {
  let (rows, gutter, children) = _prepare_stack(rows, gutter, children)
  grid(
    columns: (1fr,),
    rows: rows,
    row-gutter: gutter,
    ..children,
  )
}

#let plain-poster(fill: rgb("#1e417a")) = body => {
  let heading-1-2 = selector.or(..(1, 2).map(level => heading.where(level: level)))

  show heading-1-2: set align(center)
  show heading-1-2: set block(width: 100%, fill: fill)
  show heading-1-2: set text(white, top-edge: "ascender", bottom-edge: "descender")
  show heading.where(level: 1): set block(below: 2cm, outset: 5mm)
  show heading.where(level: 1): set text(70pt)
  show heading.where(level: 2): set block(below: 1.5cm, outset: 3mm)
  show heading.where(level: 2): set text(42pt)

  body
}
