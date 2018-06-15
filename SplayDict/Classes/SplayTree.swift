//
//  SplayTree.swift
//  Nimble
//
//  Created by 정기웅 on 14/06/2018.
//

import Foundation


class SplayTree<T: Comparable, G> {
    
    internal var tree: Node<T, G>?
    internal var size: Int = 0
    internal var top: Node<T, G>? {
        return self.tree
    }


    
    internal init() {

    }
    

    private func updateSubtreeSize(node: Node<T, G>) {
        node.subtreeSize = 1
        if let _nodeLeft = node.left { node.subtreeSize += _nodeLeft.subtreeSize }
        if let _nodeRight = node.right { node.subtreeSize += _nodeRight.subtreeSize }
    }
    
    
    
    
    private func rotate(target me: Node<T, G>) {
        guard let _myParent = me.parent else { return }
        
        let buffer: Node<T, G>?
        if _myParent.left == me {
            _myParent.left = me.right
            buffer = me.right
            me.right = _myParent
        }
        else {
            _myParent.right = me.left
            buffer = me.left
            me.left = _myParent
        }
        
        if let _buffer = buffer { _buffer.parent = _myParent }
        me.parent = _myParent.parent
        _myParent.parent = me
        
        if me.parent == nil { tree = me }
        else if _myParent == me.parent?.left { me.parent?.left = me }
        else { me.parent?.right = me }
        
        updateSubtreeSize(node: _myParent)
        updateSubtreeSize(node: me)
    }
    
    private func splay(target me: Node<T, G>) {
        while let parent = me.parent {
            let grandParent = parent.parent
            if let _grandParent = grandParent {
                if (me == parent.left) == (parent == _grandParent.left) { rotate(target: parent) }
                else { rotate(target: me) }
            }
            rotate(target: me)
        }
    }
    
    @discardableResult
    internal func insert(key: T, value: G) -> Bool {
        if var p = tree {
            findKeyPlace : while true {
                if key == p.key {
                    p.value = value
                    return false
                }
                if key < p.key {
                    guard let _pLeft = p.left else {
                        let newNode = Node<T, G>(key: key, value: value)
                        newNode.parent = p
                        p.left = newNode
                        splay(target: newNode)
                        self.size += 1
                        return true
                    }
                    p = _pLeft
                }
                else {
                    guard let _pRight = p.right else {
                        let newNode = Node<T, G>(key: key, value: value)
                        newNode.parent = p
                        p.right = newNode
                        splay(target: newNode)
                        self.size += 1
                        return true
                    }
                    p = _pRight
                }
            }
        }
        else {
            tree = Node<T, G>(key: key, value: value)
            self.size += 1
        }
        return true
    }
    
    internal func find(key: T) -> G? {
        guard var p = tree else { return nil }
        findNode : while true {
            if key == p.key { break }
            if key < p.key {
                guard let _pLeft = p.left else { break }
                p = _pLeft
            }
            else {
                guard let _pRight = p.right else { break }
                p = _pRight
            }
        }
        splay(target: p)
        
        if p.key == key { return p.value }
        return nil
    }
    
    internal func delete(key: T) {
        func delete(value key: T) {
            if find(key: key) == nil { return }
            
            self.size -= 1
            if self.size == 0 {
                tree = nil
                return
            }
            
            if tree?.left == nil {
                tree = tree?.right
                tree?.parent = nil
            }
            else if tree?.right == nil {
                tree = tree?.left
                tree?.parent = nil
            }
            else {
                var rightMost = tree?.left
                while rightMost?.right != nil { rightMost = rightMost?.right }
                rightMost?.right = tree?.right
                tree?.right?.parent = rightMost
                
                tree = tree?.left
                tree?.parent = nil
                
                splay(target: rightMost!)
            }
        }
    }
    
    
    
    internal func findKthNumber(Kth k: Int) -> Int? {
        
        return 0
    }
    
    
    
}
