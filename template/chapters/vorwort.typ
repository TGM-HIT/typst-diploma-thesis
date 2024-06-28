#import "../lib.typ": *

= Vorwort

Die Diplomarbeit ist kein Aufsatz! Auch wenn sie interessant gestaltet werden sollte, ist sie unpersönlich und im passiv zu schreiben. Besonders sind die Quellenangaben, welche entsprechend gewählt und referenziert werden müssen. Innerhalb dieser Vorlage existieren 2 Dateien, die zu genau diesem Zweck erstellt wurden. Die Datei `bibliography.bib` beinhaltet alle Quellenangaben und verwendete Literatur, `glossaries.tex` alle Definitionen von Begriffen und Akronymen, welche in der Arbeit selbst nicht genauer erklärt werden.

== Quellen

Das richtige zitieren spielt innerhalb der wissenschaftlichen Arbeit eine wichtige Rolle. Die Vorlage nutzt zur Verwaltung von Literatur ein Programm mit dem Namen `biblatex`. Mit diesem werden alle Einträge, welche sich in der Datei `bibliography.bib` befinden verarbeitet und können in der Arbeit selbst über das Kommando ```typ @key``` referenziert werden.

Als kleines Beispiel findet sich hier nun ein Zitat über Schall, aus dem ersten Phsyik Lehrbuch der Autoren, Schweitzer, Svoboda und Trieb.

#quote(attribution: [@physik1[S. 145]], block: true)[
  Mechanische Longitudinalwellen werden als Schall bezeichnet. In einem Frequenzbereich von 16 Hz bis 20 kHz sind sie für das menschliche Ohr wahrnehmbar. Liegen die Frequenzen unter diesem Bereich, so bezeichnet man diese Wellen als Infraschall, darüber als Ultraschall.
]

Eine Referenz wie diese ist möglich, wenn der entsprechende Eintrag in der dafür vorgesehenen Datei vorhanden ist. In diesem Fall sieht die Definition der Quelle wie folgt aus:

#figure(
  ```bib
  @book{ physik1,
    title = {Physik 1},
    author = {Christian Schweitzer, Peter Svoboda, Lutz Trieb},
    year = {2011},
    subtitle = {Mechanik, Thermodynamik, Optik},
    edition = {7. Auflage},
    publisher = {Veritas},
    pages = {140, 145-150},
    pagetotal = {296}
  }
  ```,
  caption: [Eintrag einer Buchquelle in BibLatex],
)

Bei einem direkten Zitat empfiehlt es sich auch die Seitenzahl anzugeben. Dies kann über die Option des Kommandos ```typ @key[S. Zahl]``` bewerkstelligt werden.

Nach der Verwendung einer Quelle, wird diese auch im Literaturverzeichnis gelistet, welche sich am Ende des Dokuments befindet.
