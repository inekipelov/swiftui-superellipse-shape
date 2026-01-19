# SuperellipseShape

A lightweight SwiftUI `Shape` that implements a superellipse curve.

## Installation (Swift Package Manager)

Add the package dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/inekipelov/swiftui-superellipse-shape.git", from: "0.0.1")
]
```

Then add `SuperellipseShape` to your target dependencies.

## Usage

```swift
import SwiftUI
import SuperellipseShape

struct ContentView: View {
    var body: some View {
        SuperellipseShape(n: 4.5, steps: 256)
            .fill(.blue)
            .frame(width: 200, height: 120)
    }
}
```
