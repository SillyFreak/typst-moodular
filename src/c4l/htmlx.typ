#import "/src/htmlx.typ": *

#let spacer = elem("p", class: "c4l-spacer")

#let container(
  element: "div",
  name,
  aria-label,
  ..args,
) = {
  assert(args.pos().len() <= 1)
  assert(args.named().values().all(v => type(v) == bool))
  let body = args.pos().at(0, default: none)
  let variants = args.named().pairs().filter(array.last).map(array.first)

  let classes = (
    "c4lv-" + name,
    ..variants.map(v => "c4l-" + v + "-variant")
  )

  spacer
  show: elem.with(
    element,
    class: classes.join(" "),
    aria-label: aria-label,
  )

  body
}
