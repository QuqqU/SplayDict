//
//  SplayDict.swift
//  Nimble
//
//  Created by 정기웅 on 14/06/2018.
//

import Foundation

protocol SplayDictProtocol {
    
}


public class SplayDict<T: Hashable, G> : SplayDictProtocol where T: Comparable {
    
    var size: Int {
        get{
            return self.splayTree.size
        }
    }
    private var splayTree = SplayTree<T, G>()

    public init() {
        
    }
   
    
    public func insert(key: T, value: G) {
        splayTree.insert(key: key, value: value)
    }
    
    public func find(key: T) -> G? {
        return splayTree.find(key: key)
    }
    
    public subscript(key: T) -> G? {
        get {
            return splayTree.find(key: key)
        }
        
        set(newValue) {
            guard let _newValue = newValue else { return }
            
            if splayTree.find(key: key) == nil {
                splayTree.insert(key: key, value: _newValue)
            }
            else {
                splayTree.top!.value = _newValue
            }
        }
    }
    
}
