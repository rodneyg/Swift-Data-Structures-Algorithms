/*
 
https://careercup.com/question?id=5072809853190144
 
Given a singly linked list of integers, write a function in java that
returns true if the given list is palindrome, else returns false.
 
*/

import UIKit

class LinkNode<T> {
    var value: T
    var next: LinkNode?
    
    init(value: T, next: LinkNode?) {
        self.value = value
        self.next = next
    }
}

struct Stack<T> {
    fileprivate var elements = [T]()
    
    public mutating func push(element: T) {
        elements.append(element)
    }
    
    public mutating func pop() -> T? {
        if elements.count < 1 {
            return nil
        } else {
            return elements.popLast()
        }
    }
}

func palindrome(head: LinkNode<NSInteger>) -> Bool {
    var elements = [NSInteger]()
    var stack = Stack<NSInteger>()
    
    elements.append(head.value)
    stack.push(element: head.value)
    
    var node = head.next
    while node != nil {
        if let next = node {
            elements.append(next.value)
            stack.push(element: next.value)
            node = next.next
        }
    }
    
    for element in elements {
        if element != stack.pop() {
            return false
        }
    }
    
    return true
}

var head = LinkNode<NSInteger>(value: 0, next: nil)

var node2 = LinkNode<NSInteger>(value: 1, next: nil)
head.next = node2

var node3 = LinkNode<NSInteger>(value: 1, next: nil)
node2.next = node3

var node4 = LinkNode<NSInteger>(value: 1, next: nil)
node3.next = node4

var node5 = LinkNode<NSInteger>(value: 0, next: nil)
node4.next = node5

print(palindrome(head: head))
