#import "_litfass.typ"
#import _litfass: tiling.pad, themes.basic as theme
#import _litfass.render: *

#let poster(tiling, theme: theme) = {
  context box(
    width: page.width,
    height: page.height,
    clip: true,

    {
      let ctx = create-context(
        (
          pos: (x: 0pt, y: 0pt),
          wh: (width: page.width, height: page.height)
        ),
        theme: theme
      )

      if type(theme.background) == color {
        place(
          top + left,
          dx: ctx.dims.pos.x,
          dy: ctx.dims.pos.y,
          rect(width: ctx.dims.wh.width, height: ctx.dims.wh.height, fill: theme.background)
        )
      } else if type(theme.background) == function {
        theme.at("background")(ctx)
      }

      apply(pad(padding: theme.padding, tiling), ctx)
    }
  )
}
