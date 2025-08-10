#import "template.typ" as template: *
#import "/src/lib.typ" as moodular

#import "@preview/cheq:0.2.2": checklist
#import "@preview/crudo:0.1.1"

#show: manual(
  package-meta: toml("/typst.toml").package,
  title: [Moodular],
  subtitle: [Use Typst's HTML export to generate content for your Moodle courses],
  date: none,
  // date: datetime(year: ..., month: ..., day: ...),

  // logo: rect(width: 5cm, height: 5cm),
  // abstract: [
  //   A PACKAGE for something
  // ],

  scope: (moodular: moodular),
)

= Introduction

This package allows you to use Typst's HTML export to generate content for your Moodle courses, but preview them faithfully in Tinymist or the webapp or target PDF in addition to Moodle.

This package is somewhat opinionated, as it contains features tailored towards specific Moodle plugins used at our own school:

- #link("https://componentsforlearning.org/")[Components for Learning (C4L)] (#link("https://moodle.org/plugins/atto_c4l")[Atto]/#link("https://moodle.org/plugins/tiny_c4l")[TinyMCE] plugin): Moodular recreates the HTML structure of C4L blocks, and also renders them for PDF export.

== HTML preview and export

one of Moodular's main features is setting up your document for HTML-equivalent preview.
This includes using a single unlimited-height page, using a sans serif font for text, and showing links in blue and underlined.
Other aspects of this include the display and blockquotes and raw blocks, which are styled to match Moodle's Boost theme's default style.

To get started apply Moodular's settings like this:

#context crudo.map(
  ```typ
  #import "/src/lib.typ" as moodular: c4l

  #show: moodular.preview()
  // or
  #show: moodular.export()
  ```,
  line => line.replace("/src/lib.typ", package-import-spec()),
)

#ref-fn("preview()") is the right choice if you only want HTML export, and use "regular" mode only to preview.
If you want to instead target both HTML and PDF exports, #ref-fn("export()") is what you want: it won't change the page setup, but apply other styles.
Both are just wrappers around #ref-fn("setup()"); the exact behavior is documented there.

== Components for Learning (C4L)

A huge part of this package is providing the #link("https://componentsforlearning.org/")[Components for Learning (C4L)] features.
Most but not all components are currently supported:

#columns(3)[
  #set heading(numbering: none, outlined: false)
  #show: checklist.with(marker-map: (
    " ": box(height: 0.85em, move(dy: -3pt, emoji.crossmark)),
    "x": box(height: 0.85em, move(dy: -3pt, emoji.checkmark.box)),
  ))

  #let ref-c4l(name, body) = link(label("c4l." + name + "()"), body)

  === Contextual components

  - [x] #ref-c4l("do-dont")[Do/Don't Cards]
  - [x] #ref-c4l("example")[Example]
  - [x] #ref-c4l("figure")[Figure]
  - [ ] Inline Tag
  - [x] #ref-c4l("key-concept")[Key concept]
  - [x] #ref-c4l("quote")[Quote]
  - [x] #ref-c4l("reading-context")[Reading Context]
  - [x] #ref-c4l("reminder")[Reminder]
  #colbreak()
  #v(4.5pt)
  - [ ] Tag
  - [x] #ref-c4l("tip")[Tip]

  === Procedural components

  - [x] #ref-c4l("attention")[Attention]
  - [ ] Due Date
  - [ ] Estimated time
  - [x] #ref-c4l("learning-outcomes")[Learning Outcomes]
  - [x] #ref-c4l("procedural-context")[Procedural Context]
  #colbreak()

  === Evaluative components

  - [x] #ref-c4l("expected-feedback")[Expected Feedback]
  - [ ] Grading Value

  === Helper components

  - [x] #ref-c4l("card")[All-purpose card]
]

The #link("https://github.com/SillyFreak/typst-moodular/tree/main/gallery")[gallery] has a document previewing some components, and you can klick on the implemented components above to go to their docs, including rendered examples.
Please open an issue at https://github.com/SillyFreak/typst-moodular/issues if you need one of the missing components.

= Module reference

#module(
  read("/src/lib.typ"),
  name: "moodular",
  label-prefix: none,
)

#module(
  read("/src/c4l/mod.typ"),
  name: "c4l",
  label-prefix: "c4l",
  scope: (
    c4l: moodular.c4l,
    c4l-example: (pad: none) => body => {
      set text(font: "Noto Sans")
      show: it => {
        if pad == none { return it }
        show: std.pad.with(..pad)
        it
      }
      body
    }
  )
)
