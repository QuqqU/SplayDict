//
//  Node.swift
//  Nimble
//
//  Created by 정기웅 on 14/06/2018.
//

import Foundation


internal class Node<T: Comparable, G> {

    internal var key: T
    internal var value: G
    internal var parent: Node?
    internal var left: Node?
    internal var right: Node?
    internal var subtreeSize = 1
    
    internal init(key: T, value: G) {
        self.key = key
        self.value = value
    }
}

extension Node: Equatable {
    internal static func ==(lhs: Node, rhs: Node) -> Bool {
        if lhs.key == rhs.key { return true }
        else { return false }
    }
}












