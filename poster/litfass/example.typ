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

  margin: 0pt,
)

#set text(28pt)

#{
  import "mod.typ" as litfass
  import "@preview/ccicons:1.0.1": *
  let poster = litfass.render.poster

  import litfass.tiling: *

  let toprow = vs(
    cut: 33%,
    cbx([#lorem(50) #parbreak() #lorem(30)], title: [Foo]),
    vs(
      cut: 50%,
      cbx([
        #figure(
          rect(width: 14cm, height: 18cm),
          caption: [
            Litfass column at Hamburg Neustadt-Süd Großneumarkt  #box-footnote[
              URL: #link("https://commons.wikimedia.org/wiki/File:Hamburg_Neustadt-Süd_Großneumarkt_Litfaßsäule.JPG", [https://commons.wikimedia.org/wiki/File:Hamburg] + "\u{00AD}" + [\_Neustadt-Süd\_Großneumarkt] + "\u{00AD}" + [\_Litfaß] + "\u{00AD}" + [säule.JPG])
              \
              LICENCE: Susanne Mu, #ccicon("cc-by-sa/3.0", link:true)
            ]
          ]
        )
      ]),
      cbx(
        [
          #lorem(45)

          Lorem ipsum dolor sit amet, consectetur #box-footnote[You can]
          adipiscing elit, sed do eiusmod tempor incididunt #box-footnote[place random footnotes]
          ut labore et dolore magnam aliquam #box-footnote[throughout a box!]
          quaerat voluptatem.
        ],
        title: [Bar]
      )
    )
  )

  let botrow = vs(cut: 33%, cbx(lorem(15), title: [Bar]), vs(cut: 50%, cbx(lorem(20), title: [Foo]), cbx(lorem(20), title: [Title])))
  let body = hs(
    cut: 40%,
    toprow,
    hs(
      cut: 55%,
      cbx(
        columns(
          2, gutter: 1em,
          lorem(240),
        ),
        title: [Big Center Block]),
      botrow
    ),
    theme: litfass.themes.basic
  )


  let title = cbx(
    [
      #set align(center)
      #set text(fill: white)
      #text(2.5em, weight: "bold")[Super Important Research About Complex Stuff]
      #v(-1em)
      #block(width: 70%, grid(
        columns: (1fr, 1fr),
        [
          #set par(spacing: 0.25em)
          Max Markov \
          #text(0.9em)[_Statistical University_ \
          Circle, Flatland]
        ],
        [
          #set par(spacing: 0.25em)
          Ernst Litfaß \
          #text(0.9em)[Berlin, Germany]
        ]
      ))
    ],
    theme: (box: (background: litfass.themes.basic.box.title.background))
  )
  let layout = hs(
    cut: 9em,
    title,
    body,
    theme: (padding: 0em)
  )

  poster(layout)
}
