#import "template.typ" as template: *
#import "/src/lib.typ" as tgm-hit-thesis

#show: manual(
  package-meta: toml("/typst.toml").package,
  title: "TGM HIT diploma thesis template",
  // subtitle: "...",
  date: datetime(year: 2025, month: 9, day: 4),

  // logo: rect(width: 5cm, height: 5cm),
  // abstract: [
  //   A PACKAGE for something
  // ],

  scope: (tgm-hit-thesis: tgm-hit-thesis),
)

= Introduction

This template is aimed at students of the information technology department at the TGM technical secondary school in Vienna. It can be used both in the Typst app and using the CLI:

Using the Typst web app, you can create a project by e.g. using the "Create new project in app" button on the package's Universe page: #context link("https://typst.app/universe/package/" + package-meta().name).

To work locally, use the following command:

#context raw(
  block: true,
  lang: "bash",
  "typst init @preview/" + package-meta().name
)

If you are getting started writing your thesis, you will likely be better off looking into the thesis document created by the template: it contains instruction and examples on the most important features of this template. If you have not yet initialized the template, a rendered version is linked in the README. If you are new to Typst, also check out the Typst documentation: https://typst.app/docs/.

The rest of this manual documents the individual functions offered by this package. This is useful if you want to know what customization options are available, or you're not sure what parts of the template package do.

As a school-specific template, this package does not offer enough configurability to be used at different institutions. However, if you like this template, feel free to adapt the code (MIT-licensed) to your needs, or check Github issue #link("https://github.com/TGM-HIT/typst-diploma-thesis/issues/6")[Github issue \#6] if there is any movement in making this template more general.


= Module reference

== `tgm-hit-thesis`

The template's main module. All functions that need to be called are directly exported from this module.

#module(
  read("/src/lib.typ"),
  name: "tgm-hit-thesis",
  label-prefix: none,
  show-module-name: false,
)

== `tgm-hit-thesis.glossary`

Wrappers for #link("https://typst.app/universe/package/glossarium")[Glossarium] functionality. The #ref-fn("glossary-entry()") function and Glossarium's ```typc gls()``` and ```typc glspl()``` are re-exported from the main module.

#module(
  read("/src/glossary.typ"),
  name: "tgm-hit-thesis.glossary",
  label-prefix: none,
  show-module-name: false,
)

== `tgm-hit-thesis.l10n`

Contains contextual constants that display localized strings. This is a thin wrapper around #link("https://typst.app/universe/package/linguify")[linguify] that improves autocomplete and avoids typos in Typst code. Have a look at the source code to see what definitions are available.

#module(
  read("/src/l10n.typ"),
  name: "tgm-hit-thesis.l10n",
  label-prefix: none,
  show-module-name: false,
)

== `tgm-hit-thesis.assets`

Contains images used in the template.

#module(
  read("/src/assets/mod.typ"),
  name: "tgm-hit-thesis.assets",
  label-prefix: none,
  show-module-name: false,
)
