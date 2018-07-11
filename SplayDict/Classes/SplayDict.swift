//
//  SplayDict.swift
//  Nimble
//
//  Created by 정기웅 on 14/06/2018.
//

import Foundation



public struct SplayDict<T: Comparable, G> {
    
    private var splayTree = SplayTree<T, G>()
    public var size: Int { return splayTree.size }
    public var elements: [(key: T, value: G)] { return splayTree.inorder() }

    public init() {}
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: T, value: G) {
        sequence.forEach { splayTree.insert($0) }
    }
    
    
    public func find(key: T) -> G? {
        return splayTree.find(key: key)
    }
    
    
    

}

// - Sequence // must be modified // error
extension SplayDict: Sequence {
    public typealias Iterator = AnyIterator<(key: T, value: G)>
    public func makeIterator() -> Iterator {
        var iter =  elements.makeIterator()
        return AnyIterator {
            return iter.next()
        }
    }
}
///////////////////////////////////


// - Accessing Key and Value
extension SplayDict {
    //insert
    public func insert(_ element: (key: T, value: G)) {
        splayTree.insert(key: element.key, value: element.value)
    }
    
    public func insert(key: T, value: G) {
        splayTree.insert(key: key, value: value)
    }
    

    
    //insert subscript
    public subscript(key: T) -> G? {
        get {
            return splayTree.find(key: key)
        }
        set(newValue) {
            guard let _newValue = newValue else { return }
            splayTree.insert(key: key, value: _newValue)
        }
    }
    
    public subscript(key: T, default defaultValue: () -> G) -> G {
        return splayTree.find(key: key) ?? defaultValue()
    }
    
    //-- top element
    public var top: (key: T, value: G)? {
        guard let _top = splayTree.top else { return nil }
        return (_top.key, _top.value)
    }
    public var topKey: T? { return splayTree.top?.key }
    public var topValue: G? { return splayTree.top?.value }
    
}


// - Describing a SplayDict
extension SplayDict: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var string: String = ""
        self.elements.forEach { string += " (key: \($0.key), value: \($0.value))," }
        string.removeLast()
        return "[\(string) ]"
    }
    public var debugDescription: String {
        var string: String = "----- SplayDict -----\n"
        self.elements.forEach { string += "--> key: \($0.key), value: \($0.value)\n" }
        return string
    }
}




















