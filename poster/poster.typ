#import "/src/assets.typ"

#let poster(
  title: none,
  authors: (),
  supervisors: (),
  partners: (),

  margin: 15mm,
  background: none,
) = body => {
  let title = grid(
    columns: (1fr,),
    rows: (15mm, 22mm, 25mm),
    align: horizon+center,
    text(28pt)[Diplomarbeit -- Abteilung Informationstechnologie],
    text(42pt, weight: "bold")[#title],
    text(20pt)[
      #authors.join[, ]\
      betreut von #supervisors.join[, ]
    ],
  )
  let title-row = grid(
    columns: (115mm, 1fr, 115mm),
    rows: (1fr,),
    grid.cell(
      inset: (top: 30mm, left: 20mm),
      align: top+left,
      assets.tgm-logo(height: 30mm),
    ),
    grid.cell(
      inset: (top: 15mm),
      align: top+center,
      title,
    ),
    grid.cell(
      inset: (top: 25mm, right: 15mm),
      align: top+right,
      assets.hit-logo(height: 40mm),
    ),
  )
  let partners = if partners.len() != 0 {
    grid(
      columns: (1fr,),
      rows: (15mm,),
      align: horizon+center,
      text(28pt)[Projektpartner: #partners.join[, ]],
    )
  }

  let header-height = 85mm + if partners != none { 20mm }
  let margin = margin
  let margin = if type(margin) in (relative, length, ratio) {
    (top: margin + header-height, rest: margin)
  } else if type(margin) in (dictionary,) {
    let get-margin(..keys, default: none) = {
      assert.eq(keys.named(), (:))
      let keys = keys.pos()
      for key in keys {
        if key in margin {
          return margin.at(key)
        }
      }
      default
    }
    margin.top = get-margin("top", "y", "rest", default: 15mm) + header-height
    margin.rest = get-margin("rest", default: 15mm)
    margin
  } else {
    panic("unexpected margin: " + repr(margin))
  }

  set page(
    paper: "a1",
    margin: margin,
    background: {
      grid(
        columns: (1fr,),
        rows: (
          82mm,
          ..if partners != none { (20mm,) },
          3mm,

          1fr,
        ),

        title-row,
        ..if partners != none { (partners,) },
        none,
        grid.hline(stroke: 0.4mm),

        background,
      )
    },
  )
  body
}
