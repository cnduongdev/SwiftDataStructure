//
//  LinkedList.swift
//  SwiftDataStructure
//
//  Created by Cao Nam Duong on 20/06/2023.
//

import Foundation

public struct LinkedList<T> {
    
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = self.head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}


extension LinkedList {
    
    public mutating func push(value: T) {
        copyNodes()
        let node = Node(value: value, next: head?.next)
        head = node
        if tail == nil {
            tail = node
        }
    }
    
    public mutating func append(value: T) {
        copyNodes()
        let node = Node(value: value, next: nil)
        if isEmpty {
            push(value: value)
            return
        }
        tail?.next = node
        tail = node
    }
    
    public func node(at index: Int) -> Node<T>? {
        
        var currentIndex = 0
        var currentNode = head
        while(currentNode?.next != nil && currentIndex < index) {
            currentIndex += 1
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(value: T, after node: Node<T>) -> Node<T> {
        copyNodes()
        guard tail !== node else {
            append(value: value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
}

extension LinkedList {
    
    @discardableResult
    public mutating func pop() -> T? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> T? {
        copyNodes()
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return tail?.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<T>) -> T? {
        guard let node = copyNodes(returningCopyOf: node) else { return nil }

        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    public mutating func reverse() {
        guard !isEmpty else { return }
        var current = head
        var prev: Node<T>? = nil
        while current != nil {
            var next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        tail = Node(value: head!.value, next: nil)
        head = prev
    }
}

extension LinkedList: Collection {
   
    public struct Index: Comparable {
        
        public var node: Node<T>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains(where: { $0 === rhs.node })
        }
    }
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail)
    }
    
    
    public func index(after index: Index) -> Index {
        return Index(node: index.node?.next)
    }
    
    public subscript(position: Index) -> T {
        return position.node!.value
    }
    
    private mutating func copyNodes() {
        guard var oldNode = head else { return }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
    private mutating func copyNodes(returningCopyOf node: Node<T>?) -> Node<T>? {
      guard !isKnownUniquelyReferenced(&head) else {
        return nil
      }
      guard var oldNode = head else {
        return nil
      }
      
      head = Node(value: oldNode.value)
      var newNode = head
      var nodeCopy: Node<T>?
      
      while let nextOldNode = oldNode.next {
        if oldNode === node {
          nodeCopy = newNode
        }
        newNode!.next = Node(value: nextOldNode.value)
        newNode = newNode!.next
        oldNode = nextOldNode
      }
      
      return nodeCopy
    }
}
