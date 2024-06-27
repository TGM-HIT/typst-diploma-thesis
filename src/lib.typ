#import "@preview/linguify:0.4.0": *

#import "assets.typ"

#let _title = state("thesis-title")
#let _authors = state("thesis-authors")

#let thesis(
  title: none,
  subtitle: none,
  authors: (),
  supervisor: none,
  date: none,
  year: none,
  division: none,
  logo: none,

  language: "de",
  paper: "a4",
) = body => {
  set document(title: title, date: date)
  set page(paper: paper)
  set text(lang: language)
  set par(justify: true)
  set line(stroke: 0.1mm)

  _title.update(title)
  _authors.update(authors)
  set-database(toml("lang.toml"))

  set heading(outlined: false)
  show heading: set heading(supplement: linguify("section"))
  show heading.where(level: 1): set heading(supplement: linguify("chapter"))
  show heading.where(level: 1): it => {
    set text(1.3em)
    pagebreak()
    v(20%)
    if it.numbering != none [
      #it.supplement #counter(heading).display()
      #parbreak()
    ]
    set text(1.3em)
    it.body
    v(1cm)
  }

  show heading.where(level: 2): it => {
    let prev = query(selector(heading).before(here()))
    if prev.len() >= 2 and prev.at(prev.len() - 2).level == 1 {
      pagebreak()
    }
    it
  }

  // title page
  set page(margin: (x: 1in, y: 0.75in))

  // header
  grid(
    columns: (auto, 1fr, auto),
    align: center+horizon,
    assets.tgm-logo(width: 3cm),
    {
      [Technologisches Gewerbemuseum]
      parbreak()
      set text(0.8em)
      [Höhere Technische Lehranstalt für Informationstechnologie]
      if division != none {
        linebreak()
        [Schwerpunkt #division]
      }
    },
    assets.htl-logo(width: 3cm),
  )
  line(length: 100%)

  v(1fr)

  // title & subtitle
  align(center, {
    if logo != none {
      logo
      v(0.5em)
    }
    text(1.44em, weight: "bold")[#linguify("thesis")]
    v(-0.5em)
    text(2.49em, weight: "bold")[#title]
    if subtitle != none {
      v(-0.7em)
      text(1.44em)[#subtitle]
    }
  })

  v(1fr)

  // authrs & supervisor
  authors.map(author => {
    grid(
      columns: (4fr, 6fr),
      row-gutter: 0.8em,
      grid.cell(colspan: 2, author.subtitle),
      author.name,
      author.class,
    )
  }).join(v(0.7em))
  v(2em)
  [
    *Betreuer:* #supervisor \
    #linguify("performed-in-year") #year
  ]

  // footer
  line(length: 100%)
  [
    #linguify("submission-note"): \
    #date.display()
    #h(1fr)
    #linguify("approved"):
    #h(3cm)
  ]

  set page(numbering: "1")

  body
}

#let declaration(body) = [
  = #linguify("declaration-title")

  #body

  #context _authors.get().map(author => {
    grid(
      columns: (4fr, 6fr),
      align: center,
      [
        #v(1.5cm)
        #line(length: 80%)
        #linguify("location-date")
      ],
      [
        #v(1.5cm)
        #line(length: 80%)
        #author.name
      ],
    )
  }).join(v(0.7em))
]

#let abstract(lang: auto, body) = [
  #set text(lang: lang) if lang != auto

  = #linguify("abstract")

  #body
]

#let main-matter() = body => {
  import "@preview/hydra:0.4.0": hydra, anchor, core

  outline()

  set heading(outlined: true, numbering: "1.1")
  set page(
    margin: (y: 1.5in),
    header-ascent: 15%,
    footer-descent: 15%,
    header: context {
      hydra(
        1,
        prev-filter: (ctx, candidates) => candidates.primary.prev.outlined == true,
        display: (ctx, candidate) => {
          _title.get()
          h(1fr)
          core.display(ctx, candidate)
          line(length: 100%)
        },
      )
      anchor()
    },
    footer: context {
      hydra(
        1,
        prev-filter: (ctx, candidates) => candidates.primary.prev.outlined == true,
        display: (ctx, candidate) => {
          line(length: 100%)
          _authors.get().map(author => author.name).join[, ]
          h(1fr)
          counter(page).display("1 / 1", both: true)
        },
      )
    },
  )

  body
}
