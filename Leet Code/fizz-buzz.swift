/*
 
https://leetcode.com/problems/fizz-buzz/
 
Write a program that outputs the string representation of numbers from 1 to n.
 
But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output
“Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
 
*/

import Foundation

func fizzBuzz(_ n: Int) -> [String] {
    var strs = [String]()
    for i in 1...n {
        if i % 3 == 0 && i % 5 == 0 {
            strs.append("FizzBuzz")
        } else if i % 5 == 0 {
            strs.append("Buzz")
        } else if i % 3 == 0 {
            strs.append("Fizz")
        } else {
            strs.append("\(i)")
        }
    }
    
    return strs
}
