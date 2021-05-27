# StarRateView
StarRateView is a star rating library created in SwiftUI.
<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platforms" />
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://github.com/yotsu12/TagLayoutView/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>
<center>
<img src="sample.gif"/>
</center>

## Usage
```swift
struct ContentView: View {
    @State var rate: Double = 2.5
    
    var body: some View {
        StarRateView(starCount: 5, rate: self.rate)
            .starSize(20)
            .starPadding(4.0)
            .forgroundStarColor(.yellow)
            .backgroundStarColor(.gray)
    }
}
```

## Installation

`StarRateView` is available via [Swift Package Manager](https://swift.org/package-manager).
go to `File -> Swift Packages -> Add Package Dependency` and enter [StarRate](https://github.com/giiiita/StarRateView)
