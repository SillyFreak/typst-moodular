#import "/src/lib.typ" as moodular: c4l, generico

#show: moodular.setup()

#quote(block: true)[
  asdf
]

Hello `World`

...

#figure(
  moodular.frame({
    rect("Hello")
  })
)

#figure(
  moodular.frame(rect())
)

...

```java
public static void main(String[] args) {

}
```

#line(length: 100%)

#lorem(50)

#c4l.key-concept[C4L Key concept #lorem(50)]

#c4l.tip(full-width: true)[C4L Tip]

#c4l.reminder[C4L Reminder]

#lorem(50)

#c4l.quote(full-width: true)[C4L Quote #lorem(50)]

#c4l.quote(attribution: lorem(5))[C4L Quote #lorem(50)]

#c4l.do-dont[C4L Do][C4L Don't]

#lorem(50)

#c4l.reading-context[C4L Reading Context #lorem(50)]

#c4l.reading-context(attribution: lorem(5), full-width: true, comfort-reading: true)[C4L Quote #lorem(50)]

#c4l.example[C4L Example][#lorem(50)]

#lorem(50)

#c4l.figure[C4L Figure]

// #c4l.tag[C4L Tag]

// #c4l.inline-tag[C4L Inline Tag]

#lorem(50)

#line(length: 100%)

#lorem(50)

#c4l.attention[C4L Attention #lorem(50)]

// #c4l.estimated-time[C4L Estimated Time]

// #c4l.due-date[C4L Due Date]

#c4l.procedural-context[C4L Procedural Context #lorem(50)]

#lorem(50)

#c4l.learning-outcomes[C4L Learning Outcomes][
  - #lorem(5) #lorem(15)
  - #lorem(20)
  - #lorem(20)
]

#c4l.learning-outcomes(full-width: true)[C4L Learning Outcomes][
  + #lorem(5) #lorem(15)
  + #lorem(20)
  + #lorem(20)
]

#lorem(50)

#line(length: 100%)

#lorem(50)

// #c4l.grading-value[C4L Grading Value]

#c4l.expected-feedback[C4L Expected Feedback #lorem(50)]

#line(length: 100%)

#c4l.card[C4L Card #lorem(50)]

#lorem(50)

#line(length: 100%)

#generico.first-name

#generico.tabs(
  generico.tab("my tab")[hello],
  generico.tab("my tab2")[world],
)
