/*
 
 Find the maximum consecutive 1's in an array of 0's and 1's.
 
 Example:
 a) 00110001001110 - Output :3 [Max num of consecutive 1's is 3]
 b) 1000010001 - Output :1 [Max num of consecutive 1's is 1]
 
 */

func maxConsecutiveOnes(a: [Int]) -> Int {
    var max = 0
    
    for i in 0..<a.count {
        if a[i] == 1 {
            var count = 0
            for j in i..<a.count {
                if a[j] == 1 {
                    count += 1
                } else {
                    break
                }
            }
            
            if count > max { max = count }
        }
    }
    
    return max
}

maxConsecutiveOnes(a: [0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0])
maxConsecutiveOnes(a: [1, 0, 0, 0, 0, 1, 0, 0, 0, 1])