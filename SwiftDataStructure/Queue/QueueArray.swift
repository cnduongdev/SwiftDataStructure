//
//  QueueArray.swift
//  SwiftDataStructure
//
//  Created by Cao Nam Duong on 13/12/2023.
//

import Foundation


struct QueueArray<T>: QueueProtocol {
    
    typealias Element = T
    private var elements: [Element] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var peek: Element? {
        return elements.first
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        elements.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    
    public var description: String {
        String(describing: elements)
    }
}
