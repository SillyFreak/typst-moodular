# Moodular

Use Typst's HTML export to generate content for your Moodle courses, but preview them faithfully in Tinymist or the webapp.

This package is somewhat opinionated, as it contains features tailored towards specific moodle plugins used at our own school:

- [Generico](https://moodle.org/plugins/filter_generico): Moodular provides functions to insert Generico tags into your document
- Components for Learning (C4L)([Atto](https://moodle.org/plugins/atto_c4l)/[TinyMCE](https://moodle.org/plugins/tiny_c4l) plugin): Moodular recreates the HTML structure of C4L blocks, and also renders them for PDF export

## Getting Started

To add this package to your project, use this:

```typ
#import "@preview/moodular:0.1.0": *

...
```

<!-- <picture>
  <source media="(prefers-color-scheme: dark)" srcset="./thumbnail-dark.svg">
  <img src="./thumbnail-light.svg">
</picture> -->

## Usage

See the [manual](docs/manual.pdf) for details.
