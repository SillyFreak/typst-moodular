#import "libs.typ": bullseye.html

#let elem(..args) = {
  let (args, attrs) = (args.pos(), args.named())
  html.elem(..args, attrs: attrs)
}

#let div = elem.with("div")

#let img(src, ..args) = elem("img", src: src, ..args)
