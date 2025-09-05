#import "../poster.typ": poster

#set text(font: "Liberation Sans")

#show: poster(
  title: [Knowdrift -- ein ewig laaaanger Diplomarbeitstitel],
  authors: (
    [Ferris Bartak],
    [Sarah Breit],
    [Manuel Kisser],
    [Julia Pöschl],
  ),
  supervisors: (
    [Mag. Erhard List BSc.],
    [Mag. Lisa Vittori BSc.],
  ),
  partners: (
    [Festo Didactic GmbH],
    [Practical Robotics Institute Austria],
  ),
)

#set text(28pt)

#import "mod.typ" as plain: *

#show: plain-poster()

= Super Important Research About Complex Stuff

#vs(
  rows: (40fr, 40fr, 20fr),
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

    #columns(2, gutter: 1em)[
      #lorem(60)

      #lorem(50)

      #lorem(80)

      #lorem(80)
    ]
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
