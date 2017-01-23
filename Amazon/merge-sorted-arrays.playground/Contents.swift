/*
 
 https://careercup.com/question?id=5119173588942848
 
 Given two sorted arrays A and B that may have repeated elements. Form a new sorted array C that contains
 the elements of A and B [Condition : You are not allowed to merge the two arrays and then sort. ]
 
 0, 1, 1, 2, 5, 6, 7, 8, 8 - A
 2, 2, 4, 5, 6, 6, 6, 6, 7 - B
 
 0, 1, 1, 2, 2, 2, 4, 5, 5, 6, 6, 6, 6, 6, 7, 8, 8 - Expected
 
*/

func combineSorted(a: [Int], b: [Int]) -> [Int] {
    var combined = [Int]()
    
    var i = 0
    var j = 0
    
    while i < a.count && j < b.count {
        if a[i] < b[j] {
            combined.append(a[i])
            i += 1
        } else if j < b.count {
            combined.append(b[j])
            j += 1
        }
    }
    
    if i < a.count {
        for c in i..<a.count {
            combined.append(a[c])
        }
    } else if i < b.count {
        for c in i..<b.count {
            combined.append(b[c])
        }
    }
    
    return combined
}

print(combineSorted(a: [0, 1, 1, 2, 5, 6, 7, 8, 8], b: [2, 2, 4, 5, 6, 6, 6, 6, 7]))