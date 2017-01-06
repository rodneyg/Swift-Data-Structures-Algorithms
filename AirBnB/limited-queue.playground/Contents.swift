/*
 
Imagine that the progamming language you are using has an array limited of 5.
Build a queue that can support this.
 
*/

import UIKit

struct LimitedQueue<T> {
    fileprivate var elements = [[]]
    fileprivate var index = 0
    fileprivate var capacity = 5
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    public var isEmpty: Bool {
        for element in elements {
            if !element.isEmpty {
                return false
            }
        }
        
        return true
    }
    
    public var count: Int {
        var total = 0
        for element in elements {
            total += element.count
        }
        
        return total
    }
    
    public mutating func enqueue(_ element: T) {
        if elements[index].count > capacity {
            index += 1
            elements.append([element])
        } else {
            elements[index].append(element)
        }
    }
    
    public mutating func dequeue() -> T? {
        if elements[index].count < 1 {
            if index == 0 {
                return nil
            } else {
                index -= 1
                return dequeue()
            }
        } else {
            return elements[index].removeFirst() as? T
        }
    }
    
    public mutating func pop() -> T? {
        if elements[index].count < 1 {
            if index == 0 {
                return nil
            } else {
                index -= 1
                return pop()
            }
        } else {
            return elements[index].popLast() as? T
        }
    }
    
    public func peek() -> T? {
        return elements[index].first as? T
    }
}
