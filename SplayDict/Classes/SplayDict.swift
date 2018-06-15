//
//  SplayDict.swift
//  Nimble
//
//  Created by 정기웅 on 14/06/2018.
//

import Foundation

protocol SplayDictProtocol {
    
}


public class SplayDict<T: Comparable, G> : SplayDictProtocol {
    
    private var splayTree = SplayTree<T, G>()
    
    public var size: Int { return splayTree.size }
    
    
    private var _elements: Array<(key: T, value: G)> = Array<(T, G)>()
    private var _keys: Array<T> = Array<T>()
    private var _values: Array<G> = Array<G>()

    public init() {}
   
    public func find(key: T) -> G? {
        return splayTree.find(key: key)
    }
    

}


// - Accessing Key and Value
extension SplayDict {
    //insert
    public func insert(key: T, value: G) {
        if splayTree.insert(key: key, value: value) {
            _elements.append((key: key, value: value))
        }
        else {
            for i in 0..<self.size {
                if _elements[i].key == key {
                    _elements[i].value = value
                    _values[i] = value
                }
            }
        }
    }
    
    //insert
    public subscript(key: T) -> G? {
        get {
            return splayTree.find(key: key)
        }
        set(newValue) {
            guard let _newValue = newValue else { return }
            splayTree.insert(key: key, value: _newValue)
        }
    }
    
    public subscript(key: T, defaultValue: G) -> G {
        return splayTree.find(key: key) ?? defaultValue
    }
    
    //--
    
    public var top: (T, G)? {
        guard let key = splayTree.top?.key, let value = splayTree.top?.value else { return nil }
        return (key, value)
    }
    
    
    public var elements: Array<(key: T, value: G)> { return _elements.sorted { $0.key < $1.key } }
    public var keys: Array<T> { return _keys.sorted() }
    public var values: Array<G> { return _values }
    
    
}


// Describing a SplayDict
extension SplayDict: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var string: String = ""
        elements.forEach { string += "( \($0.key) : \($0.value),)" }
        string.removeLast()
        return "[\(string) ]"
    }
    
    public var debugDescription: String {
        var string: String = "----- SplayDict -----\n"
        elements.forEach { string += "key: \($0.key), value: \($0.value)\n" }
        string += "/---/ SplayDict /---/\n"
        return string
    }
    
}




















