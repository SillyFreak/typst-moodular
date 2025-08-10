#import "/src/lib.typ" as moodular: c4l

#set document(date: none)

#let mode = sys.inputs.at("mode", default: "preview")
#show: moodular.setup(mode: mode)
#set page(margin: 2cm) if mode == "export"

= Using Moodular for writing instruction material

This document is a simple example showcasing how to use the Moodular package to write instructional material in a structured and visually appealing way.
The document is compiled to both HTML and PDF, so you can see how the same content is rendered in different formats.

#c4l.key-concept[
  Moodular can export to HTML and PDF formats. The PDF ("paged") export can be used to preview web-only content, or be used as an additional distribution format.
]

== HTML preview

one of Moodular's main features is setting up your document for HTML-equivalent preview.
This includes using a single unlimited-height page, using a sans serif font for text, and showing links blue and underlined.
Other aspects of this include the display of blockquotes and raw blocks, which are styled to match Moodle's Boost theme's default style.

As an example, here is a code block showing how to apply Moodular's preview settings:

```typ
#show: moodular.preview()
```

If you want to instead target both HTML and PDF exports, you can instead use this to setup your document:

```typ
#show: moodular.export()
```

This will still apply styles, but not change the page setup, so that the document can be viewed normally, as well as printed.

For dynamic use cases, you can also use the `moodular.setup()` function, which takes a `mode` parameter that can be set to either `"preview"` or `"export"`.

== Components for Learning (C4L)

A huge part is providing the #link("https://componentsforlearning.org/")[Components for Learning (C4L)] features:

#c4l.quote[
  *Components for Learning* is an open project aiming to provide *teachers and educators* with a set of visual components that fit the complex needs of learning contents.

  Such components are intended to be used in the HTML5 editor of your choice. Check the guide for a more detailed description of each component, examples, use cases and more!
]

You have already seen the `c4l.key-concept` and `c4l.quote` components in action in this document, and here's a `c4l.tip`:

#c4l.tip[
  Typst generally uses kebab-case for identifiers, so the C4L components in this package are named that way.
  For the #link("https://componentsforlearning.org/components/all-purpose-card/")["all-purpose card" component], I opted for the shorter `c4l.card`.
]

All included components support a `full-width` variant.
Without it, the component is displayed with a component-specific width relative to the full preview width (for most components, that width is 75%).
Some components offer additional variants, for example to add attribution to quotes or reading contexts.

Here's an example of using a `full-width` component, giving you an important disclaimer about this package:

#c4l.attention(full-width: true)[
  Not all C4L components are currently implemented in this package;
  for example, the #link("https://componentsforlearning.org/components/due-date/")[due date] and
  #link("https://componentsforlearning.org/components/tag/")[tag] components are not yet available;
  the full list is in the #link("https://github.com/SillyFreak/typst-moodular/blob/main/docs/manual.pdf?raw%3D1")[manual].
  If you need a specific component, please open an issue at https://github.com/SillyFreak/typst-moodular/issues.
]

= Conclusion

This document is now long enough to not fit on a single page, so you can see how the PDF export handles pagination in both the HTML preview and PDF distribution use cases.