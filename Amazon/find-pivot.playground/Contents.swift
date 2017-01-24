/*
 
 https://careercup.com/question?id=5148659814498304
 
 Given an array , find the element (say X) that has all the elements less that it to its left side and
 all the elements greater to it on its right side.
 
 The left and right elements of X need not be in sorted form.

 1, 12, 10, 19, 8, 20, 29, 30, 35, 58, 32 - input
 20 - expected
 
 */

func findPivot(a: [Int]) -> Int {
    for i in 1..<a.count {
        var less = true
        var greater = true
        
        for j in (i+1)..<a.count {
            if a[i] > a[j] {
                greater = false
                break
            }
        }
        
        
        if greater {
            for j in 0..<i {
                if a[i] < a[j] {
                    less = false
                    break
                }
            }
            
            if less {
                return a[i]
            }
        }
    }
    
    return -1
}

findPivot(a: [1, 12, 10, 19, 8, 20, 29, 30, 35, 58, 32])