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

...

#c4l.key-concept[C4L Key concept]

...

#c4l.quote[C4L Quote #lorem(50)]

...

#c4l.example[C4L Example][#lorem(50)]

...

#c4l.tip[C4L Tip]

#c4l.do-dont[C4L Do][C4L Don't]

// #c4l.figure[Figure]

#c4l.figure([asdf])

#c4l.reminder[C4L Reminder]

#c4l.reading-context[C4L Reading Context]

#c4l.attention[C4L Attention]

#c4l.procedural-context[C4L Procedural Context]

#c4l.learning-outcomes[C4L Learning Outcomes][
  - #lorem(5) #lorem(15)
  - #lorem(20)
  - #lorem(20)
]

#c4l.expected-feedback[C4L Expected Feedback]

#c4l.card[C4L Card]

#generico.first-name

#generico.tabs(
  generico.tab("my tab")[hello],
  generico.tab("my tab2")[world],
)
