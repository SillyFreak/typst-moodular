#import "libs.typ": bullseye, bullseye.html

#import "c4l.typ"
#import "generico.typ"
#import "htmlx.typ"

#let setup() = body => {
  // paged: setup page, font, link styling
  show: bullseye.show-target(paged: rest => {
    set page(height: auto, margin: 1cm)
    set text(font: "Noto Sans")
    show link: underline
    show link: set text(blue.darken(40%))
    rest
  })

  show quote.where(block: true): bullseye.show-target(paged: it => {
    show: block.with(
      width: 100%,
      stroke: (left: 5pt+rgb("#adb5bd")),
      inset: (left: 1em, y: 4pt),
    )
    set text(rgb("#495057"))
    it
  })

  show raw.where(block: true): bullseye.show-target(
    paged: it => {
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
    },
    html: it => {
      show: htmlx.elem.with("pre", class: "language-" + it.lang)
      show: htmlx.elem.with("code")
      it.text
    },
  )

  show image: bullseye.show-target(html: it => {
    htmlx.elem(
      "img",
      src: "@@PLUGINFILE@@/" + it.source,
      ..if it.alt != none { (alt: it.alt) },
      class: "img-fluid"
    )
  })

  body
}

#let frame(body) = context bullseye.on-target(
  paged: body,
  html: html.frame(body),
)
