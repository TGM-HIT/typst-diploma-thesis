/// Applies show rules for regular figure (kind: image) styling.
///
/// -> function
#let figure-style(
  supplement: none,
) = body => {
  assert.ne(supplement, none, message: "Figure supplement not set")

  show figure.where(kind: image): set figure(supplement: supplement)

  body
}

/// Applies show rules for table styling.
///
/// -> function
#let table-style(
  supplement: none,
) = body => {
  assert.ne(supplement, none, message: "Table supplement not set")

  show figure.where(kind: table): set figure(supplement: supplement)

  // table & line styles
  set line(stroke: 0.1mm)
  set table(stroke: (x, y) => if y == 0 {
    (bottom: 0.1mm)
  })

  body
}

/// Applies show rules for listing (kind: raw) styling.
///
/// -> function
#let listing-style(
  supplement: none,
) = body => {
  import "libs.typ": codly.codly-init

  assert.ne(supplement, none, message: "Listing supplement not set")

  show figure.where(kind: raw): set figure(supplement: supplement)

  show: codly-init.with()
  show figure.where(kind: raw): block.with(width: 95%)

  body
}
