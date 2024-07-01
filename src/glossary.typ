#import "@preview/glossarium:0.4.1" as glossarium: make-glossary, gls, glspl

#let _glossary_entry = <thesis-glossary-entry>

#let glossary-entry(
  key,
  short: none,
  long: none,
  desc: none,
  plural: none,
  longplural: none,
  group: none,
) = {
  assert(short != none, message: "short form of glossary-entry is mandatory")

  let entry = (
    key: key,
    short: short,
    long: long,
    desc: desc,
    plural: plural,
    longplural: longplural,
    group: group,
  )
  let entry = for (k, v) in entry {
    if v != none {
      ((k): v)
    }
  }

  [#metadata(entry) #_glossary_entry]
}

#let print-glossary(title: none, ..args) = context {
  let entries = query(_glossary_entry).map(e => e.value)

  let any-references = entries.any(e => {
    let count = glossarium.__query_labels_with_key(here(), e.key).len()
    count > 0
  })

  if any-references or args.named().at("show-all", default: false) {
    title
  }

  glossarium.print-glossary(entries, ..args)
}
