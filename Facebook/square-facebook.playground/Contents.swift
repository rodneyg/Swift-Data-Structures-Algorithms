/*
 
 Generate square of numbers in an array example [1,3,5] should come out as [1,9,25]
 
 https://careercup.com/question?id=5735749430280192
 
*/

import UIKit

func generateSquares(input: [Int]) -> [Int] {
    var squares = [Int]()
    
    for i in input {
        squares.append(i * i)
    }
    
    return squares
}

generateSquares(input: [1, 3, 5])
generateSquares(input: [8, 9, 15])
generateSquares(input: [0, 2, 7])