#import "libs.typ": bullseye

#import "htmlx.typ"
#import "c4l-util.typ"

#let spacer = context bullseye.on-target(
  paged: v(12pt),
  html: htmlx.elem("p", class: "c4l-spacer")
)

= Contextual components

/// See https://componentsforlearning.org/components/key-concept/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> set text(font: "Noto Sans")
/// >>> show: pad.with(y: -30pt)
/// c4l.key-concept[#lorem(20)]
/// ```)
///
/// -> content
#let key-concept(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
    show: c4l-util.block.with(
      margin: (y: 36pt),
      width: 100%,
      padding: (top: 24pt, right: 36pt, bottom: 30pt, left: 36pt),
      fill: rgb("#f1f5fe"),
      left-bar: rgb("#387af1"),
    )

    body
  },
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-keyconcept" + if full-width { " c4l-full-width-variant" },
      aria-label: "Key concept",
    )

    body
  },
)

/// See https://componentsforlearning.org/components/tip/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(top: -20pt)
/// c4l.tip[#lorem(20)]
/// ```)
///
/// -> content
#let tip(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-tip" + if full-width { " c4l-full-width-variant" },
      aria-label: "Tip",
    )

    body
  },
)

/// See https://componentsforlearning.org/components/reminder/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(top: -20pt)
/// c4l.reminder[#lorem(20)]
/// ```)
///
/// -> content
#let reminder(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-reminder" + if full-width { " c4l-full-width-variant" },
      aria-label: "Reminder",
    )

    body
  },
)

/// See https://componentsforlearning.org/components/quote/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(y: -30pt)
/// c4l.quote[#lorem(20)]
/// ```)
///
/// -> content
#let quote(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
  // TODO quote
) = context bullseye.on-target(
  paged: {
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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-quote" + if full-width { " c4l-full-width-variant" },
      aria-label: "Quote",
    )
    show: htmlx.div.with(class: "c4l-quote-body")
    htmlx.div(class: "c4l-quote-line", " ")
    show: htmlx.div.with(class: "c4l-quote-text")

    parbreak()
    body
  },
)

/// See https://componentsforlearning.org/components/do-dont-cards/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// c4l.do-dont[#lorem(20)][#lorem(20)]
/// ```)
///
/// -> content
#let do-dont(
  /// -> content
  do,
  /// -> content
  dont,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
    let icon(fill, icon) = {
      import "libs.typ": fontawesome.fa-icon

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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-dodontcards" + if full-width { " c4l-full-width-variant" },
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

/// See https://componentsforlearning.org/components/reading-context/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// c4l.reading-context[#lorem(20)]
/// ```)
///
/// -> content
#let reading-context(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
  // TODO quote
  // TODO comfort-reading
) = context bullseye.on-target(
  paged: {
    show: c4l-util.block.with(
      margin: (x: 11%, y: 36pt),
      shadow: true,
      width: 100%,
      padding: (top: 30pt, bottom: 32pt, x: 40pt),
    )

    body
  },
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-readingcontext" + if full-width { " c4l-full-width-variant" },
      aria-label: "Reading context",
    )

    parbreak()
    body

    // TODO quote
  },
)

/// See https://componentsforlearning.org/components/example/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// c4l.example[Title][#lorem(20)]
/// ```)
///
/// -> content
#let example(
  /// -> content
  title,
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-example" + if full-width { " c4l-full-width-variant" },
      aria-label: "Example",
    )
    htmlx.elem("h1", title)

    body
  },
)

/// See https://componentsforlearning.org/components/figure/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(y: 10pt)
/// c4l.figure[#lorem(20)]
/// ```)
///
/// -> content
#let figure(
  ..args,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: std.figure(..args),
  html: {
    assert.eq(args.pos().len(), 1)
    let ((body,), args) = (args.pos(), args.named())

    spacer
    show: htmlx.elem.with(
      "figure",
      class: "c4lv-figure" + if full-width { " c4l-full-width-variant" },
      aria-label: "Figure",
    )

    body
  },
)

// TODO Tag
// TODO Inline tag

= Procedural components

/// See https://componentsforlearning.org/components/attention/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(top: -20pt)
/// c4l.attention[#lorem(20)]
/// ```)
///
/// -> content
#let attention(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-attention" + if full-width { " c4l-full-width-variant" },
      aria-label: "Attention",
    )

    body
  },
)

// TODO Estimated Time
// TODO Due Date

/// See https://componentsforlearning.org/components/procedural-context/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(y: 10pt)
/// c4l.procedural-context[#lorem(20)]
/// ```)
///
/// -> content
#let procedural-context(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
    set text(rgb("#3a56af"), style: "italic")

    body
  },
  html: {
    spacer
    show: htmlx.elem.with(
      "p",
      class: "c4lv-proceduralcontext" + if full-width { " c4l-full-width-variant" },
      aria-label: "Procedural context",
    )

    body
  },
)

/// See https://componentsforlearning.org/components/learning-outcomes/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(top: -20pt)
/// c4l.learning-outcomes[Title][#lorem(20)]
/// ```)
///
/// -> content
#let learning-outcomes(
  /// -> content
  title,
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
  // TODO ordered-list
) = context bullseye.on-target(
  paged: {
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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-learningoutcomes" + if full-width { " c4l-full-width-variant" },
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

= Evaluative components

// TODO Grading Value

/// See https://componentsforlearning.org/components/expected-feedback/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(top: 10pt, bottom: 20pt)
/// c4l.expected-feedback[#lorem(20)]
/// ```)
///
/// -> content
#let expected-feedback(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
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
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-expectedfeedback" + if full-width { " c4l-full-width-variant" },
      aria-label: "Expected feedback",
    )

    parbreak()
    body
  },
)

= Helper components

/// See https://componentsforlearning.org/components/all-purpose-card/ for details and examples rendered in HTML.
///
/// This is how the component looks in PDF preview:
///
/// #example(dir: ttb, scale-preview: 100%, ```typc
/// >>> import moodular.c4l
/// >>> show: pad.with(y: -30pt)
/// c4l.card[#lorem(20)]
/// ```)
///
/// -> content
#let card(
  /// -> content
  body,
  /// whether the component should take up the full text width
  full-width: false,
) = context bullseye.on-target(
  paged: {
    show: c4l-util.block.with(
      margin: (x: 10%, y: 36pt),
      width: 100%,
      padding: (top: 24pt, right: 48pt, bottom: 30pt, left: 36pt),
      fill: rgb("#f1f5fe"),
      radius: 10pt,
    )

    body
  },
  html: {
    spacer
    show: htmlx.div.with(
      class: "c4lv-allpurposecard" + if full-width { " c4l-full-width-variant" },
      aria-label: "All-purpose card",
    )

    parbreak()
    body
  },
)
