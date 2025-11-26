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

  // margin: 0pt
)

#set text(28pt)

// We begin by importing the `peace-of-posters` package
#import "@preview/peace-of-posters:0.5.6": *

// Next, we specify some general settings formatting settings.
#set-poster-layout(layout-a0)
// #set text(size: layout-a0.body-size)

#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#update-poster-layout(spacing: box-spacing)

// After that we choose a predefined theme.
#set-theme(uni-fr)

#columns(2, [
  #column-box(
    heading: [Left Column],
  )[
    Multi-Column layouts are supported out of the box by typsts `columns()` method.
  ]

  #colbreak()

  #column-box(
    stretch-to-next: true,
  )[
    We can also choose to not have a title for our boxes.
  ]
])

#column-box()[
  We can update the layout of the boxes in the middle of the document.
]

#common-box(heading: [only heading])

#columns(2, [
  #colbreak()
  #column-box(
    heading: [Stretching],
    stretch-to-next: true
  )[
    And stretch boxes to the next lowest box (or bottom of the page)
  ]
])

#bottom-box()[
  Align them to the bottom.
]