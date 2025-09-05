#import "mod.typ" as plain: *

#let heading-1-2 = selector.or(..(1, 2).map(level => heading.where(level: level)))

#show heading-1-2: set align(center)
#show heading-1-2: set block(width: 100%, fill: rgb("#1e417a"))
#show heading-1-2: set text(white, top-edge: "ascender", bottom-edge: "descender")
#show heading.where(level: 1): set block(below: 2cm, outset: 5mm)
#show heading.where(level: 1): set text(70pt)
#show heading.where(level: 2): set block(below: 1.5cm, outset: 3mm)
#show heading.where(level: 2): set text(42pt)

// = Super Important Research About Complex Stuff

#vs(
  rows: (50fr, 35fr, 15fr),
  hs(
    columns: 3,
    [
      == Foo

      #lorem(50)

      #lorem(30)
    ],
    figure(
      rect(width: 14cm, height: 18cm),
      caption: [
        Litfass column at Hamburg Neustadt-Süd Großneumarkt  /*#box-footnote[
          URL: #link("https://commons.wikimedia.org/wiki/File:Hamburg_Neustadt-Süd_Großneumarkt_Litfaßsäule.JPG", [https://commons.wikimedia.org/wiki/File:Hamburg] + "\u{00AD}" + [\_Neustadt-Süd\_Großneumarkt] + "\u{00AD}" + [\_Litfaß] + "\u{00AD}" + [säule.JPG])
          \
          LICENCE: Susanne Mu, #ccicon("cc-by-sa/3.0", link:true)
        ]*/
      ]
    ),
    [
      == Bar

      #lorem(50)

      #lorem(30)
    ],
  ),
  [
    == Big Center Block

    #columns(
      2, gutter: 1em,
      lorem(240),
    )
  ],
  hs(
    columns: 3,
    [
      == Bar

      #lorem(20)
    ],
    [
      == Foo

      #lorem(20)
    ],
    [
      == Title

      #lorem(20)
    ],
  ),
)
