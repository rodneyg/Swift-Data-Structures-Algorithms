/*
 
 https://careercup.com/question?id=16306671
 
 You are given an integer array, where all numbers except for TWO numbers appear even number of times. 
 Q: Find out the two numbers which appear odd number of times.
 
 */

import UIKit

func findOddNumbers(values: [Int]) -> [Int] {
    var oddNumbers = [Int]()
    
    var numbers = [Int : Int?]()
    for value in values {
        if let numValue = numbers[value] {
            numbers[value] = numValue! + 1
        } else {
            numbers[value] = 1
        }
    }
    
    for (key, value) in numbers {
        if (value! % 2) != 0 {
            oddNumbers.append(key)
        }
    }
    
    return oddNumbers
}

findOddNumbers(values: [10, 10, 10, 10, 1, 1, 30, 30, 6])
