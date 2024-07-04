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

#let enforce-chapter-end-placement() = context {
  let ch-sel = heading.where(level: 1)
  let end-sel = selector(_chapter_end)

  let at-page(item) = "on page " + str(item.location().page())
  let ch-end-assert(check, message) = {
    if not check {
      panic(message() + " (hint: set `strict-chapter-end: false` to build anyway and inspect the document)")
    }
  }

  // make sure that there's no ends if there is no chapter
  let chs = query(ch-sel)
  if chs.len() == 0 {
    let ends = query(end-sel)
    ch-end-assert(
      ends.len() == 0,
      () => "extra chapter-end() found " + at-page(ends.first())
    )
  }

  // make sure there is no chapter end before the first chapter
  {
    let early-ends = query(end-sel.before(ch-sel))
    ch-end-assert(
      early-ends.len() == 0,
      () => "chapter-end() found before first chapter " + at-page(early-ends.first())
    )
  }

  // if we get here, the first chapter is the first interesting location
  let ch = chs.first()
  while true {
    // there may not be another chapter after the current chapter but before the chapter end
    let more-chs = ch-sel.after(ch.location(), inclusive: false)
    let more-ends = end-sel.after(ch.location(), inclusive: false)
    let chs = query(more-chs.before(more-ends))
    ch-end-assert(
      chs.len() == 0,
      () => "new chapter " + at-page(chs.first()) + " before the chapter " + at-page(ch) + " ended"
    )

    // the chapter must end with a chapter-end()
    let ends = query(more-ends)
    ch-end-assert(
      ends.len() != 0,
      () => "no chapter-end() for chapter " + at-page(ch)
    )
    let end = ends.first()

    // there may not be another chapter-end after the current end but before the next chapter
    let more-ends = end-sel.after(end.location(), inclusive: false)
    let more-chs = ch-sel.after(end.location(), inclusive: false)
    let ends = query(more-ends.before(more-chs))
    ch-end-assert(
      ends.len() == 0,
      () => "extra chapter-end() " + at-page(ends.first())
    )

    // now the chapter may come
    let chs = query(more-chs)
    if chs.len() == 0 {
      break
    }
    ch = chs.first()
  }
  // if we get here, there are no more chapters and all chapters were terminated
}

#let is-first-section() = {
  // all previous headings
  let prev = query(selector(heading).before(here(), inclusive: false))
  // returns whether the previous heading is a chapter heading
  prev.len() != 0 and prev.last().level == 1
}

// the following function is from
// https://github.com/EpicEricEE/typst-plugins/blob/b13b0e1bc30beba65ff19d029e2dad61239a2819/outex/src/outex.typ#L1-L27
// Copyright (c) 2023 Eric Biedert, MIT License

// Repeat the given content to fill the full space.
//
// Parameters:
// - gap: The gap between repeated items. (Default: none)
// - justify: Whether to increase the gap to justify the items. (Default: false)
//
// Returns: The repeated content.
#let repeat(
  gap: none,
  justify: false,
  body
) = layout(size => style(styles => {
  let pt(length) = measure(h(length), styles).width
  let width = measure(body, styles).width
  let amount = calc.floor(pt(size.width + gap) / pt(width + gap))

  let gap = if not justify { gap } else {
    (size.width - amount * width) / (amount - 1)
  }

  let items = ((box(body),) * amount)
  if type(gap) == length and gap != 0pt {
    items = items.intersperse(h(gap))
  }

  items.join()
}))
