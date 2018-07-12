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
    public var elements: [Element<T, G>] { return splayTree.inorder() }

    public init() {}
    public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: T, value: G) {
        sequence.forEach { splayTree.insert(key: $0.key, value: $0.value) }
    }
    
    
    public func find(key: T) -> G? {
        return splayTree.find(key: key)
    }
    
    
    

}

// - Sequence
extension SplayDict: Sequence {
    public func makeIterator() -> IndexingIterator<[Element<T, G>]> {
        return elements.makeIterator()
    }
}

// - Collection
/*
extension SplayDict: Collection {
    public var startIndex: T {
        return self.elements.startIndex
    }
    
    public var endIndex: T {
        return self.elements.endIndex
    }
    
    
}
*/

// - Accessing Key and Value
extension SplayDict {
    //insert
    public func insert(_ element: Element<T, G>) {
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
    public var top: Element<T, G>? {
        guard let _top = splayTree.top else { return nil }
        return Element(key: _top.key, value: _top.value)
    }
    public var topKey: T? { return splayTree.top?.key }
    public var topValue: G? { return splayTree.top?.value }
    
}


// - Expressible by literal
extension SplayDict: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element<T, G>
    public init(arrayLiteral elements: ArrayLiteralElement...) {
        self.init()
        elements.forEach { self.splayTree.insert(key: $0.key, value: $0.value) }
    }
}



// - Describing a SplayDict
extension SplayDict: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var string: String = ""
        self.elements.forEach { string += " (key: \($0.key), value: \($0.value))," }
        if !string.isEmpty { string.removeLast() }
        return "[\(string) ]"
    }
    public var debugDescription: String {
        var string: String = "----- SplayDict -----\n"
        self.elements.forEach { string += "--> key: \($0.key), value: \($0.value)\n" }
        return string
    }
}




















