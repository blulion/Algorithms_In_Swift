//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array A [ ] having distinct elements, the task is to find the next greater element for each element of the array in order of their appearance in the array. If no such element exists, output -1
 
 Input:
 The first line of input contains a single integer T denoting the number of test cases.Then T test cases follow. Each test case consists of two lines. The first line contains an integer N denoting the size of the array. The Second line of each test case contains N space separated positive integers denoting the values/elements in the array A[ ].
 
 Output:
 For each test case, print in a new line, the next greater element for each array element separated by space in order.
 
 Example:
 Input
 1 3 2 4
 
 Output
 3 4 4 -1
*/

//http://practice.geeksforgeeks.org/problems/stock-span-problem/0

let arr = [1,3,2,4]

var j = 0
var result = -1
if (arr.count > 1){
    for i in 0..<arr.count {
        j = i + 1
        result = -1
        while j < arr.count {
            if (arr[j] > arr[i]){
                result = arr[j]
                break
            }
            j = j + 1
        }
        print("\(result) \n")
    }
}



