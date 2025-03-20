/// Applies show rules for regular figure (kind: image) styling.
///
/// -> function
#let figure-style(
  /// The figure supplement
  /// -> content
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
  /// The table supplement
  /// -> content
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
  /// The listing supplement
  /// -> content
  supplement: none,
) = body => {
  import "libs.typ": codly.codly-init

  assert.ne(supplement, none, message: "Listing supplement not set")

  show figure.where(kind: raw): set figure(supplement: supplement)

  show: codly-init.with()
  show figure.where(kind: raw): block.with(width: 95%)

  body
}

/// Applies show rules for chapter-wise figure numbering.
///
/// -> function
#let numbering() = body => {
  import "libs.typ": i-figured

  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure
  show math.equation: i-figured.show-equation

  body
}

/// Shows the outlines for the three kinds of figures, if such figures exist.
///
/// -> content
#let outlines(
  /// The figures outline title
  /// -> content
  figures: none,
  /// The tables outline title
  /// -> content
  tables: none,
  /// The listings outline title
  /// -> content
  listings: none,
) = {
  import "libs.typ": i-figured, outrageous

  assert.ne(figures, none, message: "List of figures title not set")
  assert.ne(tables, none, message: "List of tables title not set")
  assert.ne(listings, none, message: "List of listings title not set")

  let kinds = (
    (image, figures),
    (table, tables),
    (raw, listings),
  )

  show outline.entry: outrageous.show-entry.with(
    ..outrageous.presets.outrageous-figures,
  )

  for (kind, title) in kinds {
    context if query(figure.where(kind: kind)).len() != 0 {
      title
      i-figured.outline(title: none, target-kind: kind)
    }
  }
}
