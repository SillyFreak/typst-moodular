#let elem(..args) = {
  let (args, attrs) = (args.pos(), args.named())
  html.elem(..args, attrs: attrs)
}

#let div = elem.with("div")
