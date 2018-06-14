//
//  Node.swift
//  Nimble
//
//  Created by 정기웅 on 14/06/2018.
//

import Foundation


class Node<T: Comparable, G> {

    var key: T
    var value: G
    var parent: Node?
    var left: Node?
    var right: Node?
    var subtreeSize = 1
    
    init(key: T, value: G) {
        self.key = key
        self.value = value
    }
}
extension Node: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        if lhs.key == rhs.key { return true }
        else { return false }
    }
}
