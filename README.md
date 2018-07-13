# SplayDict


[![Version](https://img.shields.io/cocoapods/v/SplayDict.svg?style=flat)](https://cocoapods.org/pods/SplayDict)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/QuqqU/SplayDict/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/SplayDict.svg?style=flat)](https://cocoapods.org/pods/SplayDict)
[![Swift](https://img.shields.io/badge/Swift-4.0-%23FB613C.svg)](https://developer.apple.com/swift/)
[![Xcode](https://img.shields.io/badge/Xcode-9-green.svg)](https://developer.apple.com/xcode)



SplayDict written in Swift, is a collection type like special ordered [set](https://developer.apple.com/documentation/swift/set?changes=_2). 
It's based on [Splay tree](https://en.wikipedia.org/wiki/Splay_tree) which reflects tendency of search input data. 

- [What is SplayDict?](#why)
- [TODO](#TODO)
- [Requirment](#Requirment)
- [Installation](#Installation)
- [Usage](#Usage)
- [Contact](#Contact)
- [License](#License)


<a id="why"></a>
## What is SplayDict?
SplayDict is Dictionary using splay tree, not red-black tree.
Due to attribution of splay tree, it is very fast to get data searched frequently.

In real world, so many search are requested. And many people request a same(or similar) data. Every request, every new search. It's very consumptively. 

Using SplayDict, it's not waste of time. It takes a very short time to get data searched frequently. (But, It takes a little more time to find data searched occasionally.) 
According to [Pareto's law](https://en.wikipedia.org/wiki/Pareto_principle), using SplayDict makes a program be productive, and even faster.

<a id="TODO"></a>
## TODO
- travis (I don't know how to do...)
- SplayTree
- flatMap
- SplayDict to Json
- Subscript
- More methods
- Adopt protocols such as CustomStringConvertible, Sequence, etc.

<a id="Requirment"></a>
## Requirement

- iOS 10.0+
- Xcode 9+



<a id="Installation"></a>


## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it using the following command.

```bash
$ sudo gem install cocoapods --pre
```
> Cocoapod 1.5.3+ is required.

To use SplayDict in your project using CocoaPod, add the following code in your `Podfile`.

```ruby
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SplayDict', '~> 0.2.3'
end
```


After you edit Podfile, then run the command below.

```bash
$ pod install
```

<a id="Usage"></a>
## Usage


### Declaration
```swift
var a: SplayDict<Int, Double> = SplayDict() // make a empty SplayDict.
var b = SplayDict([(1, 3.1), (2, 5.2)]) // make with sequence contents.
```
And more constructor is building...


### Insert
```swift
var a: SplayDict<Int, Int> = SplayDict()
a.insert(key: 3, value: 7)
// Insert [3 : 7] into SplayDict.

a[5] = 12
// Insert [5 : 12] into SplayDict.
```
If you want to insert key which is already exists,
then being value is replaced with newValue.


### Top
Nil if SplayDict is empty.
```swift
var a: SplayDict<Int, String> = SplayDict()
let (c, d) = a.top!
// Return a top element key & value of SplayDict.
// It's a latest searched data.
// Read-only property

_ = a.top?.key
_ = a.topKey
// Return top element key.

_ = a.top?.value
_ = a.topValue
// Return top element value
```

### Find
```swift
var a: SplayDict<Int, String> = SplayDict()
let value: String? = a.find(key: 7) 
```
Return value if search value exists, else return nil.  
And this make searched key(or nearest key) be on a top of SplayDict.


### Delete
```swift
var a: SplayDict<Int, String> = SplayDict()
a.delete(key: 5)
```
Delete element corresponded with key in SplayDict.  
Make a biggest key under input be a top element.


### Read
```swift
var a: SplayDict<Int, Double> = SplayDict()
let value: Double? = a.indexOf(3)
// Return n-th value if SplayDict.
// If index is out of range, returns nil.

_ = a[4]
// You can use subscript to read value related to key.
// If there is no key corresponding to input, return value as nil.

_ = a[12]{50}
// You can set default value rather than nil.
// If there is key corresponding to input, return value related to input key.
// Otherwise, return default value.

_ = a.elements
// Return all [key : value] elements orderly according to comparable key.

_ = a.keys
// Return all keys orderly.

_ = a.values
// Return all values unorderly.
``` 


### Other Operations
```swift
a.reverse(from: 3, to: 6)
// Reverse elements. (from 3 to 6)
// Implement using Lazy Propagtion.
```
Let splay set consists of [0, 1, 2, 3, 4, 5, 6].  
reverse(from: 3, to : 6).   
The result is [0, 1, 2, 6, 5, 4, 3].






<a id="Contact"></a>
## Contact

QuqqU(KiUng Jung)

- rldnd913@naver.com
- rldnd913@icloud.com


<a id="License"></a>
## License

Copyright `QuqqU`(KiUng Jung) 2018 ~   
SplayDict is available under the `MIT` license. See the LICENSE file for more info.
