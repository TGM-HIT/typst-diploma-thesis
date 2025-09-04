#import "/src/lib.typ": *

#show: thesis(
  title: [Keine Panik!],
  subtitle: [Mit Typst durch die Diplomarbeit],
  authors: (
    // ATTENTION: chapters/about.typ:104 references this list of example authors. When changing
    // this list, you need to adjust/remove that line!
    (name: "Arthur Dent", class: [5xHIT], subtitle: [Untertitel des Themengebiets von Arthur Dent]),
    (name: "Ford Prefect", class: [5xHIT], subtitle: [Untertitel des Themengebiets von Ford Prefect]),
    (name: "Tricia McMillan", class: [5xHIT], subtitle: [Untertitel des Themengebiets von Tricia McMillan]),
    (name: "Zaphod Beeblebrox", class: [5xHIT], subtitle: [Untertitel des Themengebiets von Zaphod Beeblebrox]),
  ),
  // the German default supervisor label is the non-gendered "Betreuer", so you can override it here
  // as necessary
  supervisor-label: [Betreuer:in],
  supervisor: [DSc MSc Deep Thought],
  date: datetime(year: 2018, month: 4, day: 4),
  year: [2017/18],
  division: [Medientechnik, Systemtechnik],
  logo: none,
  read: path => read(path),
  bibliography: bibliography("bibliography.bib", full: true),

  // language: "en",
  // current-authors: "only",
)

#context bib.alexandria.get-bibliography(auto).references.map(x => x.details)

#register-glossary(
  glossary-entry(
    "tgm",
    short: "TGM",
    long: "Technologisches Gewerbemuseum",
    // group: "Accronyms",
  ),
)
