# SplayDict


[![CI Status](https://img.shields.io/travis/QuqqU/SplayDict.svg?style=flat)](https://travis-ci.org/QuqqU/SplayDict)
[![Version](https://img.shields.io/cocoapods/v/SplayDict.svg?style=flat)](https://cocoapods.org/pods/SplayDict)
[![License](https://img.shields.io/cocoapods/l/SplayDict.svg?style=flat)](https://cocoapods.org/pods/SplayDict)
[![Platform](https://img.shields.io/cocoapods/p/SplayDict.svg?style=flat)](https://cocoapods.org/pods/SplayDict)

SplayDict written in Swift, is a collection type like special ordered [set](https://developer.apple.com/documentation/swift/set?changes=_2). 
It's based on [Splay tree](https://en.wikipedia.org/wiki/Splay_tree) which reflects tendency of search input data. 

- [Why is SplayDict needed?](#why)
- [TODO](#TODO)
- [Usage](#Usage)
- [Requirment](#Requirment)
- [Installation](#Installation)
- [Contact](#Contact)
- [License](#License)


<a id="why"></a>
## Why is SplayDict needed?

In real world, so many search are requested. And many people requset a same(or similar) data. Every request, every new search. It's very consumptively. 

Using SplayDict, it's not waste of time. It takes a very short time to get data searched frequently. (But, It takes a little more time to find data searched occasionally.) 
According to [Pareto's law](https://en.wikipedia.org/wiki/Pareto_principle), using SplayDict makes a program be productive, and even faster.

<a id="TODO"></a>
## TODO
- SplayTree
- flatMap
- SplayDict to Json
- Subscript
- More methods
- Adopt protocols such as CustomStringConvertible, Sequence, etc.


<a id="Usage"></a>
## Usage

- declaration
```swift
var a: SplayDict<Int> = SplayDict() // make a empty splay set.
var b = SplayDict([1, 3, 2]) // make a set which contains 1, 2, 3.

// and more constructor is building...
```

- insert
```swift
var a: SplayDict<Int> = SplayDict()
a.insert(3)
// Insert integer 3 into splay tree(SplayDict).
```

- top
```swift
_ = a.top 
// Return a top element of SplayDict.
// It's a latest searched data.
```

- find
```
_ = a.find(3) 
// Return true if search value exists, else return false.
// And this make search value(or nearest value) be on a top of SplayDict.
```

- delete
```swift
a.delete(5)
// Delete element in SplayDict.
// Make a biggest value under input element be a top value.
```

- indexOf
```swift
_ = a.indexOf(3)
// Return n-th element if SplayDict.
// If index is out of range, returns nil.
```

- reverse
```swift
a.reverse(from: 3, to: 6)
// Reverse elements. (from 3 to 6)
// Implement using Lazy Propagtion.

// example
// Let splay set consists of [0, 1, 2, 3, 4, 5, 6].
// reverse(from: 3, to : 6).
// The result is [0, 1, 2, 6, 5, 4, 3].
```








<a id="Requirment"></a>
## Requirement

- iOS 10.0+
- Xcode 9+



<a id="Installation"></a>
SplayDict is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
## Installation

```ruby
pod 'SplayDict'
```


<a id="Contact"></a>
## Contact

QuqqU(KiUng Jung)

- rldnd913@naver.com
- rldnd913@icloud.com


<a id="License"></a>
## License

Copyright `QuqqU`(KiUng Jung) 2018 ~   
SplayDict is available under the `MIT` license. See the LICENSE file for more info.