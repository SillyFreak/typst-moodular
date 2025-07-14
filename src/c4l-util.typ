#let margin(..margins) = {
  assert.eq(margins.pos().len(), 0)
  let margins = margins.named()
  block.with(inset: margins)
}

#let shadow(body, ..args) = {
  import "@preview/umbra:0.1.0": shadow-path

  assert.eq(args.pos().len(), 0)

  layout(size => {
    let (width, height) = measure(body, ..size)

    place(shadow-path(
      (0pt, 0pt), (0pt, height), (width, height), (width, 0pt),
      shadow-radius: 1.2cm,
      shadow-stops: (gray.lighten(80%), white),
      closed: true,
      ..args,
    ))

    body
  })
}

#let _shadow = shadow

#let block(
  body,
  margin: none,
  shadow: none,
  padding: none,
  left-bar: none,
  top-left-float: none,
  top-right-float: none,
  bottom-left-float: none,
  bottom-right-float: none,
  ..args,
) = {
  assert.eq(args.pos().len(), 0)

  show: std.block.with(inset: margin)
  show: it => {
    if shadow in (none, false) { it }
    else if shadow == true { _shadow(it) }
    else if type(shadow) in (dictionary, arguments) { _shadow(it, ..shadow)}
    else { panic("shadow must be none, bool or dictionary") }
  }
  show: std.block.with(
    inset: padding,
    ..{
      if type(left-bar) == color { (stroke: (left: 6pt+left-bar)) }
      else if left-bar != none { (stroke: (left: left-bar)) }
    },
    ..args,
  )

  let get(dict, ..keys, default: none) = {
    assert.eq(keys.named().len(), 0)

    for key in keys.pos() {
      if key in dict { return dict.at(key) }
    }
    default
  }

  let float(spec, anchor) = {
    if spec == none { return }
    if type(spec) != dictionary { spec = (body: spec) }

    let padding = (:) + padding
    let y = get(padding, repr(anchor.y), "y", "rest", default: 0pt)
    if anchor.y == top { y = -y }
    let x = get(padding, repr(anchor.x), "x", "rest", default: 0pt)
    if anchor.x == left { x = -x }
    let (body, dx, dy) = (dx: 0pt, dy: 0pt) + spec

    place(anchor, dx: x + dx, dy: y + dy, body)
  }

  float(top-left-float, top+left)
  float(top-right-float, top+right)
  float(bottom-left-float, bottom+left)
  float(bottom-right-float, bottom+right)

  body
}

#let icon-flag(fill, icon) = {
  import "@preview/fontawesome:0.5.0": *

  show: std.block.with(
    inset: (x: 7pt, y: 4pt),
    radius: (top-left: 3pt, bottom-left: 3pt),
    fill: fill,
  )

  fa-icon(icon, 1.5em, white)
}
