#import "@preview/tidy:0.3.0"
#import "@preview/crudo:0.1.0"

#import "template.typ": *

#import "/src/lib.typ" as template

#let package-meta = toml("/typst.toml").package
#let date = none
// #let date = datetime(year: ..., month: ..., day: ...)

#show: project.with(
  title: "TGM HIT diploma thesis template",
  // subtitle: "...",
  authors: package-meta.authors.map(a => a.split("<").at(0).trim()),
  abstract: [
    A diploma thesis template for students of the HIT department at TGM Wien.
  ],
  url: package-meta.repository,
  version: package-meta.version,
  date: date,
)

// the scope for evaluating expressions and documentation
#let scope = (template: template)

= Introduction

TODO

= Module reference

== `tgm-hit-thesis`

#{
  let module = tidy.parse-module(
    read("/src/lib.typ"),
    // label-prefix: "tgm-hit-thesis.",
    scope: scope,
  )
  tidy.show-module(
    module,
    sort-functions: none,
    style: tidy.styles.minimal,
  )
}
