#import "util.typ"

#let generico(placeholder, block: false, ..fields) = {
  assert.eq(fields.pos().len(), 0)
  let fields = fields.named()

  util.target-conditional(
    paged: () => {
      let container = if block { std.block } else { box }
      show: container.with(
        fill: gray.lighten(50%),
        inset: (x: 0.2em),
        outset: (y: 0.3em),
        radius: 0.2em,
      )
      set text(gray.darken(30%), style: "italic")
      placeholder
    },
    html: () => {
      show: if block { par } else { it => it }
      "{GENERICO:"
      fields.pairs()
        .map(((k, v)) => k + "=" + repr(v))
        .join(",")
      "}"
    },
  )
}

#let first-name = generico(type: "firstname")[first name]

#let tabs(..tabs) = {
  assert.eq(tabs.named().len(), 0)
  let tabs = tabs.pos()

  generico(type: "tabs", block: true)[[tabs]]
  tabs.join()
  generico(type: "tabs_end", block: true)[[/tabs]]
}

#let tab(title, body) = {
  generico(type: "tabitem", title: title, block: true)[[tab *#title*]]
  body
  generico(type: "tabitem_end", block: true)[[/tab]]
}
