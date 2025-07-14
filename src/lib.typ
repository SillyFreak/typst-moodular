#import "c4l.typ"
#import "generico.typ"
#import "util.typ"
#import "htmlx.typ"

#let setup() = util.target-conditional.with(
  paged: doc => {
    set page(width: 14cm, height: auto, margin: 1cm)
    set text(font: "Noto Sans")

    show quote.where(block: true): it => {
      show: block.with(
        width: 100%,
        stroke: (left: 5pt+rgb("#adb5bd")),
        inset: (left: 1em, y: 4pt),
      )
      set text(rgb("#495057"))

      it
    }

    show raw.where(block: true): it => {
      show: block.with(
        width: 100%,
        fill: rgb("#f5f2f0"),
        inset: 1em,
      )
      show: block.with(
        width: 100%,
        fill: rgb("#fafafa"),
        inset: 0.5em,
      )

      it
    }

    doc
  },
  default: doc => {
    show raw.where(block: true): it => {
      show: htmlx.elem.with("pre", class: "language-" + it.lang)
      show: htmlx.elem.with("code")
      it.text
    }

    doc
  },
)

#let frame = util.target-conditional.with(
  paged: body => body,
  html: body => html.frame(body),
)
