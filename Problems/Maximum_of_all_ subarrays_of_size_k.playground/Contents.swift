//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array and an integer k, find the maximum for each and every contiguous subarray of size k.
 
 Input:
 The first line of input contains an integer T denoting the number of test cases. The description of T test cases follows.
 The first line of each test case contains a single integer 'N' denoting the size of array and the size of subarray 'k'.
 The second line contains 'N' space-separated integers A1, A2, ..., AN denoting the elements of the array.
 
 Output:
 Print the maximum for every subarray of size k.
 
 Constraints:
 1 ≤ T ≤ 200
 1 ≤ N ≤ 100
 1 ≤ k ≤ N
 0 ≤A[i]<1000
 
 Example:
 
 Input:
 2
 9 3
 1 2 3 1 4 5 2 3 6
 10 4
 8 5 10 7 9 4 15 12 90 13
 
 Output:
 3 3 4 5 5 5 6
 10 10 10 15 15 90 90
*/

//http://practice.geeksforgeeks.org/problems/maximum-of-all-subarrays-of-size-k/0

let arr = [9, 1, 9, 0, 10, 9] //=> 9 9 10 10
//[10, 9, 8, 7, 6, 5, 4, 3, 2 ] => 10,9,8,7,6,5,4
//[8, 5, 10, 7, 9, 4, 15, 12, 90, 13] => 10 10 10 15 15 90 90
//[1,2,3,1,4,5,2,3,6] => 3 3 4 5 5 5 6



func findMaxValInSubArray(n:Int,k:Int) {
    var j = 0
    while j+k <= n {
        
        print(arr[findMaxVal(tArray: arr, start: j, end: j+(k-1))])
        j = j + 1
    }
}


func findMaxVal(tArray:Array<Int>,start:Int,end:Int) -> Int {
    //print("Start: \(start) and End: \(end)")
    var index = start
    if (tArray.count > 0){
        var maxValue = tArray[start]
        index = start
        for i in start+1...end {
           // print("I is \(i)")
            if (tArray[i] > maxValue){
                maxValue = tArray[i]
                index = i
               // print("Max is \(maxValue)")
            }
        }
    }
    return index
}
//let index = findMaxVal(tArray: arr, start: 5, end: 8)
findMaxValInSubArray(n: arr.count, k: 3)



