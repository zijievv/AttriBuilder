# AttriBuilder

`AttriBuilder` is a Swift domain-specific language for constructing `AttributedString`'s with SwiftUI-like syntax.

## Usage

```swift
var body: some View {
    VStack {
        Text(nestedText)
        article
    }
    .padding()
}

@AttributedStringBuilder
private var nestedText: AttributedString {
    Group {
        "Hello, "
            .color(.green)
            .italic()
        "world"
            .underline(.init(pattern: .dot, color: .brown))
            .bold()
        "!"
            .color(.orange)
    }
    .color(.blue)
    .underline(.init(pattern: .dashDot, color: .yellow))
    .fontAttribute(.largeTitle)
}

@AttributedStringBuilder
private var article: Text {
    Paragraph(prefixBlankLines: 0) {
        "Voluptate anim consectetur occaecat. Do sit laborum ad enim cillum consequat. Amet ad consectetur voluptate in do dolor elit dolor cillum cillum in."
    }
    Group {
        Paragraph {
            "Title3 ullamco tempor ipsum incididunt."
                .bold()
        }
        .url("https://www.apple.com")
        .configuring { attributedString in
            attributedString.foregroundColor = .orange
        }
        .underline()
        Paragraph(suffixBlankLines: 0) {
            "Footnote "
                .bold()
            "consectetur in voluptate qui. Nisi culpa nisi nisi. Veniam quis adipisicing voluptate Lorem ullamco adipisicing fugiat non sunt irure aliqua laborum dolor est. "
            "Ad aute incididunt non est minim exercitation duis labore ad et occaecat duis eu incididunt culpa. "
                .italic()
                .color(.teal)
            "Commodo velit quis anim commodo do."
                .bold()
                .fontAttribute(.system(.body, design: .monospaced).bold())
        }
        .fontAttribute(.footnote)
    }
    .fontAttribute(.system(.title3, design: .rounded))
}
```

![Preview](https://github.com/user-attachments/assets/3960bdcd-3e1d-4b5e-9b58-18d72d431261)
