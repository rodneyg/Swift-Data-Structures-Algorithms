/*
 
 https://careercup.com/question?id=6285101383024640

 Given an Array of N elements and Integer K, write a function that returns true if the sum
 of any 2 elements of Array is K, false otherwise.
 
*/

import UIKit

struct Stack<Int> {
    var elements = [Int]()
    
    mutating func push(element: Int) {
        elements.append(element)
    }
    
    func peek() -> Int? {
        return elements.last
    }
    
    mutating func pop() -> Int? {
        guard let last = peek() else { return nil }
        
        elements.removeLast()
        
        return last
    }
}

func sumOfElements(elements: [Int], sum: Int) -> Bool {
    guard elements.count > 0 else { return false }
    
    var stack = Stack<Int>()
    for element in elements {
        stack.push(element: element)
    }
    
    var i = 0
    while let current = stack.pop() {
        var j = elements.count - 1

        for element in elements {
            if i != j && (current + element == sum) {
                return true
            }
            
            j -= 1
        }
        
        i += 1
    }
    
    return false
}

sumOfElements(elements: [0, 1, 1, 6, 7, 10], sum: 2) //returns true
sumOfElements(elements: [0, 1, 1, 6, 7, 10], sum: 10) //returns true
sumOfElements(elements: [5, 1, 1, 6, 7, 10], sum: 10) //returns false


