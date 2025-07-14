#import "util.typ"
#import "htmlx.typ"
#import "c4l-util.typ"

#let key-concept = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (y: 36pt),
      width: 100%,
      padding: (top: 24pt, right: 36pt, bottom: 30pt, left: 36pt),
      fill: rgb("#f1f5fe"),
      left-bar: rgb("#387af1"),
    )

    body
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-keyconcept",
      aria-label: "Key concept",
    )
    body
  },
)

#let quote = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (x: 10%, y: 36pt),
      width: 100%,
      padding: (left: 16pt),
      left-bar: 4pt+rgb("#387af1"),
    )
    show: block.with(inset: (top: 4pt, bottom: 2pt))

    let qm(body) = {
      set text(1.2em, rgb("#387af1"), weight: "bold")
      box(height: 0.5em, body)
    }
    qm[“]
    text(font: "Liberation Serif", style: "italic", body)
    qm[”]
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-quote",
      aria-label: "Quote",
    )
    show: htmlx.div.with(class: "c4l-quote-body")
    htmlx.div(class: "c4l-quote-line", " ")
    show: htmlx.div.with(class: "c4l-quote-text")

    parbreak()
    body
  },
)

#let example = util.target-conditional.with(
  paged: (title, body) => {
    show: c4l-util.block.with(
      margin: (x: 11%, y: 36pt),
      shadow: true,
      width: 100%,
      padding: (y: 36pt, x: 48pt),
    )

    {
      set text(0.9em, rgb("#3171e3"), weight: "bold")
      show: block.with(
        stroke: (bottom: 2pt+rgb("#3171e3")),
        inset: (bottom: 5pt),
      )

      upper(title)
    }

    body
  },
  html: (title, body) => {
    show: htmlx.div.with(
      class: "c4lv-example",
      aria-label: "Example",
    )
    htmlx.elem("h1", title)

    body
  },
)

#let tip = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (top: 24pt, bottom: 8pt, x: 0.5%),
      width: 100%,
      padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
      fill: rgb("#fbeffa"),
      left-bar: rgb("#b00ca9"),
      top-right-float: (dx: 3pt, dy: 6pt, body: c4l-util.icon-flag(rgb("#b00ca9"), "lightbulb")),
    )

    body
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-tip",
      aria-label: "Tip",
    )

    body
  },
)

#let do-dont = util.target-conditional.with(
  paged: (do, dont) => {
    let icon(fill, icon) = {
      import "@preview/fontawesome:0.5.0": *

      show: block.with(
        inset: (x: 12pt, y: 8pt),
      )

      fa-icon(icon, 1.5em, fill)
    }

    {
      show: c4l-util.block.with(
        margin: (x: 10%),
        width: 100%,
        padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
        fill: rgb("#f1fbf5"),
        radius: 10pt,
        top-right-float: icon(green, "check-circle"),
      )

      do
    }
    {
      show: c4l-util.block.with(
        margin: (x: 10%),
        width: 100%,
        padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
        fill: rgb("#ffefef"),
        radius: 10pt,
        top-right-float: icon(red, "xmark-circle"),
      )

      dont
    }
  },
  html: (do, dont) => {
    show: htmlx.div.with(
      class: "c4lv-dodontcards",
      aria-label: "Do/don't cards",
    )
    htmlx.div(
      class: "c4l-dodontcards-do",
      aria-label: "Do card",
      do
    )
    htmlx.div(
      class: "c4l-dodontcards-dont",
      aria-label: "Don't card",
      dont
    )
  },
)

#let figure(..args) = util.target-conditional(
  paged: () => std.figure(..args),
  html: () => {
    assert.eq(args.pos().len(), 1)
    let ((body,), args) = (args.pos(), args.named())

    show: htmlx.elem.with(
      "figure",
      class: "c4lv-figure",
      aria-label: "Figure",
    )

    body
  },
)

#let reminder = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (top: 24pt, bottom: 8pt, x: 0.5%),
      width: 100%,
      padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
      fill: rgb("#eff8fd"),
      left-bar: rgb("#16b9ff"),
      top-right-float: (dx: 3pt, dy: 6pt, body: c4l-util.icon-flag(rgb("#16b9ff"), "thumbtack")),
    )

    body
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-reminder",
      aria-label: "Reminder",
    )

    body
  },
)

#let reading-context = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (x: 11%, y: 36pt),
      shadow: true,
      width: 100%,
      padding: (top: 30pt, bottom: 32pt, x: 40pt),
    )

    body
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-readingcontext",
      aria-label: "Reading context",
    )

    parbreak()
    body
  },
)

#let attention = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (top: 24pt, bottom: 8pt, x: 0.5%),
      width: 100%,
      padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
      fill: rgb("#fef6ed"),
      left-bar: rgb("#f88923"),
      top-right-float: (dx: 3pt, dy: 6pt, body: c4l-util.icon-flag(rgb("#f88923"), "circle-exclamation")),
    )

    body
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-attention",
      aria-label: "Attention",
    )

    body
  },
)

#let procedural-context = util.target-conditional.with(
  paged: body => {
    set text(rgb("#3a56af"), style: "italic")

    body
  },
  html: body => {
    show: htmlx.elem.with(
      "p",
      class: "c4lv-proceduralcontext",
      aria-label: "Procedural context",
    )

    body
  },
)

#let learning-outcomes = util.target-conditional.with(
  paged: (title, body) => {
    show: c4l-util.block.with(
      margin: (top: 24pt, bottom: 8pt, x: 0.5%),
      width: 100%,
      padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
      fill: rgb("#f2f5fd"),
      top-left-float: (dx: -3pt, dy: 6pt, body: {
        show: block.with(
          inset: (x: 7pt, y: 4pt),
          radius: (top-right: 3pt, bottom-right: 3pt),
          fill: rgb("#497ae9"),
        )
        set text(0.8em, white, weight: "bold")

        upper(title)
      }),
    )
    set list(
      spacing: 21pt,
      marker: {
        set text(rgb("#497ae9"))
        sym.triangle.r.filled
      },
    )

    v(24pt)

    body
  },
  html: (title, body) => {
    show: htmlx.div.with(
      class: "c4lv-learningoutcomes",
      aria-label: "Learning outcomes",
    )

    htmlx.elem(
      "h6",
      class: "c4l-learningoutcomes-title",
      title,
    )

    // TODO set <ul class="c4l-learningoutcomes-list"
    body
  },
)

#let expected-feedback = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (top: 24pt, bottom: 8pt, x: 11%),
      shadow: true,
      width: 100%,
      padding: (top: 24pt, right: 36pt, bottom: 30pt, left: 36pt),
      radius: 8pt,
      bottom-right-float: (dx: 3pt, dy: -6pt, body: c4l-util.icon-flag(rgb("#497ae9"), "exclamation-circle")),
    )
    set text(style: "italic")

    body
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-expectedfeedback",
      aria-label: "Expected feedback",
    )

    parbreak()
    body
  },
)

#let card = util.target-conditional.with(
  paged: body => {
    show: c4l-util.block.with(
      margin: (x: 10%, y: 36pt),
      width: 100%,
      padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
      fill: rgb("#f1f5fe"),
      radius: 10pt,
    )

    body
  },
  html: body => {
    show: htmlx.div.with(
      class: "c4lv-allpurposecard",
      aria-label: "All-purpose card",
    )

    parbreak()
    body
  },
)
