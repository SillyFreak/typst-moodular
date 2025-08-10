# Moodular

Use Typst's HTML export to generate content for your Moodle courses, but preview them faithfully in Tinymist or the webapp.

This package is somewhat opinionated, as it contains features tailored towards specific Moodle plugins used at our own school:

- [Components for Learning (C4L)](https://componentsforlearning.org/) ([Atto](https://moodle.org/plugins/atto_c4l)/[TinyMCE](https://moodle.org/plugins/tiny_c4l) plugin): Moodular recreates the HTML structure of C4L blocks, and also renders them for PDF export

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

## License

Copyright (C) 2025 Clemens Koza

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
