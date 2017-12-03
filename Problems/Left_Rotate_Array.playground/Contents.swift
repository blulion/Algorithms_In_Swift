//: Playground - noun: a place where people can play

import UIKit

/*
    To Solve this problem, there are 3 methods available
 
     Let  array arr = [1,2,3,4,5,6] and k be 2 (number of rotation)
 
    Method 1:
        We take the first `k` elements from the array `arr` and copy it into new array.
        So new array would be temp = [1,2]
 
        Now remove first `k` elements from the array `arr` and append the values of `temp` to the end of the array `arr`.
 
                or 
        Shift the remaining elements of the array by `d` position and replace the temp array value to last `k` elements of array `arr`
 
                arr = [3,4,5,6,1,2]
 
 */

//https://www.youtube.com/watch?v=utE_1ppU5DY

var numbers = [41, 73, 89, 7, 10, 11, 59, 58, 84, 77, 77, 97, 58, 1, 86, 58, 26, 10, 86, 51]

//Juggling Algorithm
func leftRotate(n: Int,k: Int) -> [Int]{
    var j = 0;
    var d = 0;
    for i in 0..<gcd(a: k, b: n) {
        let temp  = numbers[i]
        j = i
        while (true) {
            d = (j + k)%n;
            if (d == i){
                break;
            }
            numbers[j] = numbers[d]
            j = d
        }
        numbers[j] = temp
    }
    return numbers
}


func gcd(a: Int, b: Int) -> Int
{
    if(a == 0){
        print("GCD: \(b)")
        return b
    }
    else{
        //print("a: \(a) and b: \(b%a)")
        return gcd(a: b%a, b: a);
    }
}


func rightRotate(n: Int,k: Int) -> [Int]{
    var temp: [Int] = [0,0]
    var t = 0;
    var d = 0;
    var j = 0;
    for i in 0..<gcd(a: k, b: n) {
        temp[0] = numbers[i]
        j = i
        t = 0
        //print("Temp[0]: \(temp[0]) and numbers: \(numbers)")
        while (true){
            d = (k + j)%n
            if (t % 2 == 0){
                temp[1] = numbers[d]
                numbers[d] = temp[0]
            }
            else{
                temp[0] = numbers[d]
                numbers[d] = temp[1]
            }
            
            if (i == d){break;}
            j = d;
            t = t + 1;
        }
        //print("temp[0]: \(temp[0]), temp[1]: \(temp[1]), i: \(i), j: \(j), d: \(d), t: \(t)")
        //print("NUMBERS: \(numbers)")
    }
    return numbers
}


print(rightRotate(n: numbers.count, k: 10))
//print(leftRotate(n: numbers.count, k: 4));

//[41, 73, 89, 7, 10, 11, 59, 58, 84, 77, 77, 97, 58, 1, 86, 58, 26, 10, 86, 51]
