#import "assets.typ"
#import "l10n.typ"
#import "glossary.typ"
#import "utils.typ"

#let _builtin_bibliography = bibliography

#let _authors = state("thesis-authors")

#import utils: chapter-end
#import glossary: glossary-entry, gls, glspl

#let thesis(
  title: none,
  subtitle: none,
  authors: (),
  supervisor: none,
  date: none,
  year: none,
  division: none,
  logo: none,
  bibliography: none,

  language: "de",
  paper: "a4",
) = body => {
  import "@preview/hydra:0.4.0": hydra, anchor
  import "@preview/i-figured:0.2.4"

  // basic document & typesetting setup
  set document(title: title, date: date)
  set page(paper: paper)
  set text(lang: language)
  set par(justify: true)

  // make properties accessible as state
  _authors.update(authors)

  // setup linguify
  l10n.set-database()

  // setup i-figured
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure
  show math.equation: i-figured.show-equation

  // setup glossarium
  show: glossary.make-glossary

  // general styles

  // figure supplements
  show figure.where(kind: image): set figure(supplement: l10n.figure)
  show figure.where(kind: table): set figure(supplement: l10n.table)
  show figure.where(kind: raw): set figure(supplement: l10n.listing)

  // table & line styles
  set line(stroke: 0.1mm)
  set table(stroke: (x, y) => if y == 0 {
    (bottom: 0.1mm)
  })

  // references to non-numbered headings
  show ref: it => {
    if type(it.element) != content { return it }
    if it.element.func() != heading { return it }
    if it.element.numbering != none { return it }

    link(it.target, it.element.body)
  }

  // title page

  {
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
      text(1.44em, weight: "bold")[#l10n.thesis]
      v(-0.5em)
      text(2.49em, weight: "bold")[#title]
      if subtitle != none {
        v(-0.7em)
        text(1.44em)[#subtitle]
      }
    })

    v(1fr)

    // authors & supervisor
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
      *#l10n.supervisor:* #supervisor \
      #l10n.performed-in-year #year
    ]

    // footer
    line(length: 100%)
    [
      #l10n.submission-note: \
      #date.display()
      #h(1fr)
      #l10n.approved:
      #h(3cm)
    ]
  }

  // regular page setup

  // show header & footer on "content" pages, show only page number in chapter title pages
  set page(
    margin: (x: 1in, y: 1.5in),
    header-ascent: 15%,
    footer-descent: 15%,
    header: context {
      if utils.is-chapter-page() {
        // no header
      } else if utils.is-empty-page() {
        // no header
      } else {
        hydra(
          1,
          prev-filter: (ctx, candidates) => candidates.primary.prev.outlined == true,
          display: (ctx, candidate) => {
            title
            h(1fr)

            if candidate.has("numbering") and candidate.numbering != none {
              l10n.chapter
              [ ]
              numbering(candidate.numbering, ..counter(heading).at(candidate.location()))
              [. ]
            }
            candidate.body

            line(length: 100%)
          },
        )
        anchor()
      }
    },
    footer: context {
      if utils.is-chapter-page() {
        align(center)[
          #counter(page).display("1")
        ]
      } else if utils.is-empty-page() {
        // no footer
      } else {
        hydra(
          1,
          prev-filter: (ctx, candidates) => candidates.primary.prev.outlined == true,
          display: (ctx, candidate) => {
            line(length: 100%)
            authors.map(author => author.name).join[, ]
            h(1fr)
            counter(page).display("1 / 1", both: true)
          },
        )
      }
    },
  )

  // front matter headings are not outlined
  set heading(outlined: false)
  // Heading supplements are section or chapter, depending on level
  show heading: set heading(supplement: l10n.section)
  show heading.where(level: 1): set heading(supplement: l10n.chapter)
  // chapters start on a right page and have very big, fancy headings
  show heading.where(level: 1): it => {
    set text(1.3em)
    pagebreak(to: "odd")
    v(20%)
    if it.numbering != none [
      #it.supplement #counter(heading).display()
      #parbreak()
    ]
    set text(1.3em)
    it.body
    v(1cm)
  }
  // the first section of a chapter starts on the next page
  show heading.where(level: 2): it => {
    if utils.is-first-section() {
      pagebreak()
    }
    it
  }

  // the body contains the declaration, abstracts, and then the main matter

  body

  // back matter

  // bibliography is outlined, and we use our own header
  {
    set _builtin_bibliography(title: none)
    set heading(outlined: true)

    [= #l10n.bibliography <bibliography>]
    bibliography
    chapter-end()
  }

  // List of {Figures, Tables, Listings} only shown if there are any such elements
  context {
    if query(figure.where(kind: image)).len() != 0 {
      [= #l10n.list-of-figures <list-of-figures>]

      i-figured.outline(
        title: none,
        target-kind: image,
      )
    }

    if query(figure.where(kind: table)).len() != 0 {
      [= #l10n.list-of-tables <list-of-tables>]

      i-figured.outline(
        title: none,
        target-kind: table,
      )
    }

    if query(figure.where(kind: raw)).len() != 0 {
      [= #l10n.list-of-listings <list-of-listings>]

      i-figured.outline(
        title: none,
        target-kind: raw,
      )
    }
  }

  // glossary is outlined
  {
    set heading(outlined: true)

    glossary.print-glossary(title: [= #l10n.glossary <glossary>])
  }
}

#let declaration(body) = [
  #let signature-height = 1.3cm
  #let caption-spacing = -0.2cm

  = #l10n.declaration-title <declaration>

  #body

  #context _authors.get().map(author => {
    grid(
      columns: (4fr, 6fr),
      align: center,
      [
        #v(signature-height)
        #line(length: 80%)
        #v(caption-spacing)
        #l10n.location-date
      ],
      [
        #v(signature-height)
        #line(length: 80%)
        #v(caption-spacing)
        #author.name
      ],
    )
  }).join(v(0.7em))
]

#let abstract(lang: auto, body) = [
  #set text(lang: lang) if lang != auto

  #context [
    #[= #l10n.abstract] #label("abstract-" + text.lang)
  ]

  #body
]

#let main-matter() = body => {
  outline()

  set heading(outlined: true, numbering: "1.1")

  body
}
