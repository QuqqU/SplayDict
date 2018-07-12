//
//  Element.swift
//  Pods
//
//  Created by 정기웅 on 13/07/2018.
//

import Foundation


public struct Element<T, G> {
    public var key: T
    public var value: G
    
    public init(key: T, value: G) {
        self.key = key
        self.value = value
    }
    public init(_ key: T, _ value: G) {
        self.key = key
        self.value = value
    }
}



extension Element: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String { return "(key: \(self.key), value: \(self.value))" }
    public var debugDescription: String { return "Element<\(T.self), \(G.self)>(key: \(self.key), value: \(self.value))" }
}
