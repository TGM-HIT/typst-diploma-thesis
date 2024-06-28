#import "lib.typ": *

#show: thesis(
  title: [Keine Panik!],
  subtitle: [Mit Typst durch die Diplomarbeit],
  authors: (
    (name: [Arthur Dent], class: [5xHIT], subtitle: [Untertitel des Themengebiets von Arthur Dent]),
    (name: [Ford Prefect], class: [5xHIT], subtitle: [Untertitel des Themengebiets von Ford Prefect]),
    (name: [Tricia McMillan], class: [5xHIT], subtitle: [Untertitel des Themengebiets von Tricia McMillan]),
    (name: [Zaphod Beeblebrox], class: [5xHIT], subtitle: [Untertitel des Themengebiets von Zaphod Beeblebrox]),
  ),
  supervisor: [DSc MSc Deep Thought],
  date: datetime(year: 2018, month: 4, day: 4),
  year: [2017/18],
  division: [Medientechnik, Systemtechnik],
  logo: assets.logo(width: 3cm),
  bibliography: bibliography("bibliography.bib"),

  // language: "en",
)

#declaration[
  Ich erkläre an Eides statt, dass ich die vorliegende Arbeit selbstständig verfasst, andere als die angegebenen Quellen/Hilfsmittel nicht benutzt und die den benutzten Quellen wörtlich und inhaltlich entnommenen Stellen als solche kenntlich gemacht habe.
  Für die Erstellung der Arbeit habe ich auch folgende Hilfsmittel generativer KI-Tools [z. B. ChatGPT, Grammarly Go, Midjourney] zu folgendem Zweck verwendet:

  - ChatGPT: eigentlich für eh alles

  // I declare that I have authored this thesis independently, that I have not used other than the declared sources and that I have explicitly marked all material which has been quoted either literally or by content from the used sources.
  // I also used the following generative AI tools [e.g. ChatGPT, Grammarly Go, Midjourney] for the following purpose:

  // - ChatGPT: for basically everything
]

#include "chapters/kurzfassung.typ"

#show: main-matter()

#include "chapters/vorwort.typ"
#include "chapters/danksagung.typ"
#include "chapters/einleitung.typ"
#include "chapters/studie.typ"
#include "chapters/konzept.typ"
#include "chapters/implementierung.typ"
#include "chapters/retrospektive.typ"
#include "chapters/conclusio.typ"
