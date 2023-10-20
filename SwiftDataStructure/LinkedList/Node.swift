//
//  Node.swift
//  SwiftDataStructure
//
//  Created by Cao Nam Duong on 20/06/2023.
//

import Foundation

public class Node<T> {
    
    public var value: T
    public var next: Node<T>?
    
    public init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = self.next else {
            return "\(value)"
        }
        return "\(value) -> " + (String(describing: next)) + " "
    }
}
