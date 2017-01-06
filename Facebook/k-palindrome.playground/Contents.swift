/*
 
 https://careercup.com/question?id=6287528252407808
 
 A k-palindrome is a string which transforms into a palindrome on removing at most k characters.
 
 Given a string S, and an interger K, print "YES" if S is a k-palindrome; otherwise print "NO".
 Constraints:
 S has at most 20,000 characters.
 0<=k<=30
 
 Sample Test Case#1:
 Input - abxa 1
 Output - YES
 Sample Test Case#2:
 Input - abdxa 1
 Output - No
 
 */

func palindrome(str: String, range: Range<Int>) -> Bool {
    guard str.characters.count > 1 else { return true }
    
    let chars = Array(str.lowercased().characters)
    
    let first = chars[range.lowerBound]
    let last = chars[range.upperBound]
    
    
    if first == last {
        if range.lowerBound + 1 >= range.upperBound - 1 { return true }
        
        return palindrome(str: str, range: Range(range.lowerBound+1..<range.upperBound-1))
    } else {
        return false
    }
}

palindrome(str: "zttttz", range: Range(0 ..< "zttttz".characters.count-1))

func kpalindrome(str: String, r: Int, k: Int) -> Bool {
    guard r < k else { return false }
    
    if !palindrome(str: str, range: Range(0 ..< str.characters.count-1)) {
        var str2 = str
        let index = str2.index(str2.startIndex, offsetBy: r)
    
        str2.remove(at: index)
        print(str2)
        return kpalindrome(str: str2, r: r + 1, k: k)
    } else {
        return true
    }
}

print(kpalindrome(str: "abxa", r: 0, k: 1))
