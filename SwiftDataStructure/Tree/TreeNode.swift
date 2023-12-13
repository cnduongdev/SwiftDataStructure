//
//  Tree.swift
//  SwiftDataStructure
//
//  Created by Cao Nam Duong on 13/12/2023.
//

import Foundation

public class TreeNode<T> {
    
    public var value: T
    
    public var children: [TreeNode] = []
    
    init(value: T, children: [TreeNode] = []) {
        self.value = value
        self.children = children
    }
}


