#let is-chapter-page() = {
  // all chapter headings
  let chapters = query(heading.where(level: 1))
  // return whether one of the chapter headings is on the current page
  chapters.any(c => c.location().page() == here().page())
}

// this is an imperfect workaround, see
// - https://github.com/typst/typst/issues/2722
// - https://github.com/typst/typst/issues/4438
// it requires manual insertion of `#chapter-end()` at the end of each chapter
#let _chapter_end = <thesis-chapter-end>
#let chapter-end() = [#metadata(none) #_chapter_end]
#let is-empty-page() = {
  // page where the next chapter begins
  let next-chapter = {
    let q = query(heading.where(level: 1).after(here()))
    if q.len() != 0 {
      q.first().location().page()
    }
  }

  // page where the current chapter ends
  let current-chapter-end = {
    let q = query(heading.where(level: 1).before(here()))
    if q.len() != 0 {
      let current-chapter = q.last()
      let q = query(selector(_chapter_end).after(current-chapter.location()))
      if q.len() != 0 {
        q.first().location().page()
      }
    }
  }

  if next-chapter == none or current-chapter-end == none {
    return false
  }

  // return whether we're between two chapters
  let p = here().page()
  current-chapter-end < p and p < next-chapter
}

#let is-first-section() = {
  // all previous headings
  let prev = query(selector(heading).before(here(), inclusive: false))
  // returns whether the previous heading is a chapter heading
  prev.len() != 0 and prev.last().level == 1
}
