/*

Implement a function that finds a palindrome in a string.
 
*/

import UIKit

func palindrome(str: String, range: Range<Int>) -> Bool {
    guard str.characters.count > 1 else { return true }
    
    let chars = Array(str.lowercased().characters)
    
    print(range)
    
    let first = chars[range.lowerBound]
    let last = chars[range.upperBound]
    
    print("first: \(first) last: \(last)")
    
    if first == last {
        if range.lowerBound + 1 >= range.upperBound - 1 { return true }
        
        return palindrome(str: str, range: Range(range.lowerBound+1..<range.upperBound-1))
    } else {
        return false
    }
}

palindrome(str: "zttttz", range: Range(0 ..< "zttttz".characters.count-1)) //true
palindrome(str: "zttttz", range: Range(0 ..< "ztttt".characters.count-1)) //false
