//
//  QueueProtocol.swift
//  SwiftDataStructure
//
//  Created by Cao Nam Duong on 13/12/2023.
//

import Foundation


protocol QueueProtocol {
    
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
