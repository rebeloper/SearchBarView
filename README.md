# 🔎 SearchBarView

![swift v5.3](https://img.shields.io/badge/swift-v5.3-orange.svg)
![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
![deployment target iOS 14](https://img.shields.io/badge/deployment%20target-iOS%2014-blueviolet)

**SearchBarView** is a lightweight library that creates a native `SwiftUI` search bar similar to the `UISearchBar`.

## 💻 Installation
### 📦 Swift Package Manager
Using <a href="https://swift.org/package-manager/" rel="nofollow">Swift Package Manager</a>, add it as a Swift Package in Xcode 11.0 or later, `select File > Swift Packages > Add Package Dependency...` and add the repository URL:
```
https://github.com/rebeloper/SearchBarView.git
```
### ✊ Manual Installation
Download and include the `SearchBarView` folder and files in your codebase.

### 📲 Requirements
- iOS 14+
- Swift 5.3+

## 👉 Import

Import `SearchBarView` into your `View`

```
import SearchBarView
```

## 🧳 Features

Here's the list of the awesome features `SearchBarView` has:
- [X] 100% `SwiftUI` code
- [X] Bindable search text
- [X] Callbacks: `onEditingChanged`, `onCommit` and `onCancel`
- [X] Fully customizable

## 💻 How to Use

Here are the ways that you can create a new `SearchBarView`:

```
@State var searchText = ""

var body: some View {
    VStack {
        
        SearchBarView(text: $searchText)
        
        SearchBarView(text: $searchText) {
            print("onCancel")
        }
        
        SearchBarView(title: "Type to search...", text: $searchText) {
            print("onCancel")
        }
        
        SearchBarView(title: "Type to search...", text: $searchText, font: .custom("American Typewriter", size: 24), iconView: { () -> AnyView in
            AnyView(Image(systemName: "wand.and.stars.inverse").foregroundColor(Color(.orange)))
        }, showsCancelButton: true, cancelButtonLabel: { () -> AnyView in
            AnyView(Image(systemName: "xmark").font(.system(size: 28, weight: .bold)).foregroundColor(.white))
        }, showsClearSearchButton: true, clearSearchButtonLabel: { () -> AnyView in
            AnyView(Text("Clear").bold().foregroundColor(.red))
        }, textBackgroundView: { () -> AnyView in
            AnyView(RoundedRectangle(cornerRadius: 32).foregroundColor(Color(.secondarySystemBackground)))
        }, backgroundView: { () -> AnyView in
            AnyView(Color.purple)
        }, spacing: 16) { (isTyping) in
            print("Is typing: \(isTyping)")
        } onCommit: {
            print("onCommit")
        } onCancel: {
            print("onCancel")
        }
        
        Spacer()
    }
}
```

Here's the created view:

<img src="../main/Sources/Resources/SearchBarView0.png" width="350px">

And when the user has typed something:

<img src="../main/Sources/Resources/SearchBarView1.png" width="350px">

Also in Dark Appearance:

<img src="../main/Sources/Resources/SearchBarView2.png" width="350px">

<img src="../main/Sources/Resources/SearchBarView3.png" width="350px">

## ✍️ Contact

<a href="https://rebeloper.com/">rebeloper.com</a> / 
<a href="https://www.youtube.com/rebeloper/">YouTube</a> / 
<a href="https://store.rebeloper.com/">Shop</a> / 
<a href="https://rebeloper.com/mentoring">Mentoring</a>

## 📃 License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

