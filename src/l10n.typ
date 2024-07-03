#import "@preview/linguify:0.4.0"

#let set-database() = linguify.set-database(toml("l10n.toml"))

#let thesis = linguify.linguify("thesis")
#let supervisor = linguify.linguify("supervisor")
#let performed-in-year = linguify.linguify("performed-in-year")
#let submission-note = linguify.linguify("submission-note")
#let approved = linguify.linguify("approved")

#let declaration-title = linguify.linguify("declaration-title")
// #let declaration-text = linguify.linguify("declaration-text")
// #let declaration-ai-clause = linguify.linguify("declaration-ai-clause")
#let location-date = linguify.linguify("location-date")

#let chapter = linguify.linguify("chapter")
#let section = linguify.linguify("section")
#let abstract = linguify.linguify("abstract")

#let figure = linguify.linguify("figure")
#let table = linguify.linguify("table")
#let listing = linguify.linguify("listing")

#let bibliography = linguify.linguify("bibliography")
#let list-of-figures = linguify.linguify("list-of-figures")
#let list-of-tables = linguify.linguify("list-of-tables")
#let list-of-listings = linguify.linguify("list-of-listings")
#let glossary = linguify.linguify("glossary")
