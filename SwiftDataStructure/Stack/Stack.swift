//
//  Stack.swift
//  SwiftDataStructure
//
//  Created by Cao Nam Duong on 26/04/2023.
//

import Foundation

public struct Stack<Element> {
    
    
    private var storage: [Element] = []
    
    public init() {}
    
    public init(elements: [Element]) {
        self.storage = elements
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return storage.isEmpty
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}


extension Stack {
    
    public mutating func push(value: Element) {
        storage.append(value)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
}
