/*

Build a LinkedList and implement a method that removed the Nth
Node from the back.
 
*/

import UIKit

class LinkNode {
    var value: Int
    var next: LinkNode?
    var previous: LinkNode?
    
    init(value: Int, next: LinkNode?, previous: LinkNode?) {
        self.value = value
        self.next = next
    }
}

func removeFromBack(head: LinkNode, n: Int) -> LinkNode? {
    var count = 0
    var total = 0
    while let head = head.next {
        total += 1
    }
    
    while let head = head.next {
        if total - count == n {
            head.previous = head.next
            head.previous?.next = head.next
            return head
        }
        
        count += 1
    }
    
    return nil
}