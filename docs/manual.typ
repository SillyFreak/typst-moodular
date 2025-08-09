#import "template.typ" as template: *
#import "/src/lib.typ" as moodular

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

This package allows you to use Typst's HTML export to generate content for your Moodle courses, but preview them faithfully in Tinymist or the webapp.

This package is somewhat opinionated, as it contains features tailored towards specific Moodle plugins used at our own school:

- #link("https://moodle.org/plugins/filter_generico")[Generico]: Moodular provides functions to insert Generico tags into your document
- #link("https://componentsforlearning.org/")[Components for Learning (C4L)] (#link("https://moodle.org/plugins/atto_c4l")[Atto]/#link("https://moodle.org/plugins/tiny_c4l")[TinyMCE] plugin): Moodular recreates the HTML structure of C4L blocks, and also renders them for PDF export

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
)

#module(
  read("/src/htmlx.typ"),
  name: "htmlx",
  label-prefix: "htmlx",
)
