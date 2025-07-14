#let target = dictionary(std).at("target", default: () => "paged")

#let target-conditional(..args) = context {
  let (args, targets) = (args.pos(), args.named())
  let target = targets.at(target(), default: targets.at("default", default: none))
  if target != none {
    target(..args)
  }
}
