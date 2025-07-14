#import "template.typ" as template: *
#import "/src/lib.typ" as moodular

#show: manual(
  package-meta: toml("/typst.toml").package,
  title: [Moodular],
  subtitle: [Create Moodle activity content using Typst's HTML export],
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

= Module reference

#module(
  read("/src/lib.typ"),
  name: "moodular",
  label-prefix: none,
)
