//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array of integers, write a function that returns true if there is a triplet (a, b, c) that satisfies a2 + b2 = c2.
 
 Input:
 The first line contains 'T' denoting the number of testcases. Then follows description of testcases.
 Each case begins with a single positive integer N denoting the size of array.
 The second line contains the N space separated positive integers denoting the elements of array A.
 
 Output:
 For each testcase, print "Yes" or  "No" whtether it is Pythagorean Triplet or not.
 
 Constraints:
 1<=T<=50
 1<=N<=100
 1<=A[i]<=100
 
 Example:
 Input:
 1
 5
 3 2 4 6 5
 Output:
 Yes
*/

//http://practice.geeksforgeeks.org/problems/pythagorean-triplet/0

var arr = [74, 87, 22, 46, 25, 73, 71, 30, 78, 74, 98, 13, 87, 91, 62, 37, 56, 68, 56, 75, 32, 53, 51, 51, 42, 25, 67, 31, 8, 92, 8, 38, 58, 88, 54, 84, 46, 10, 10, 59, 22, 89, 23, 47, 7, 31, 14, 69, 1, 92, 63, 56, 11, 60, 25]//60 63 87

//[42, 12, 54, 69, 48, 45, 63, 58, 38, 60, 24, 42, 30, 79, 17, 36, 91, 43, 89, 7, 41, 43, 65, 49, 47, 6, 91, 30, 71, 51, 7, 2, 94, 49, 30, 24, 85, 55, 57, 41, 67, 77, 32, 9, 45, 40, 27, 24, 38, 39, 19, 83, 30, 42, 34, 16, 40, 59, 5, 31, 78]//[4, 49, 1, 59, 19, 81, 97, 99, 82, 90, 99, 10, 58, 73, 23]//[3,2,4,6,5]
//[93, 39, 80,  57, 12, 3,  87]
//2,3,4,5,6

//[3, 12, 29, 35, 39, 47, 56, 57, 63, 73, 80, 87, 89, 93]
/*func isPythogorianTriplet(array:Array<Int>) -> Bool {
    var isPythogorian = false
    
    for i in 0..<array.count-1 {
        var a = array[i]*array[i]
      //  print("I is \(i)")
        for j in i+1..<array.count-1 {
            var b = array[j]*array[j]
            for k in j+1..<array.count{
                var c = array[k]*array[k]
                //print("A:\(a),B:\(b),C:\(c)")
                if (a+b == c){//60 63 87
                    print("A:\(array[i]),B:\(array[j]),C:\(array[k])")
                  //  print("Break....")
                    isPythogorian = true
                    break
                }
            }
            //print("J is \(j)")
            if (isPythogorian){break;}
        }
        //print("---------------")
        if (isPythogorian){break;}
    }
    return isPythogorian
}*/



func isPythogorianTriplet() -> Bool {
    var isPythogorian = false
    for i in 0..<arr.count {
        arr[i] = arr[i]*arr[i]
    }
    QuickSort(array: &arr, p: 0, r: arr.count-1)
    //print(arr)
    
    //[1, 49, 64, 64, 100, 100, 121, 169, 196, 484, 484, 529, 625, 625, 625, 900, 961, 961, 1024, 1369, 1444, 1764, 2116, 2116, 2209, 2601, 2601, 2809, 2916, 3136, 3136, 3136, 3364, 3481, 3600, 3844, 3969, 4489, 4624, 4761, 5041, 5329, 5476, 5476, 5625, 6084, 7056, 7569, 7569, 7744, 7921, 8281, 8464, 8464, 9604]
    
    for i in stride(from: arr.count-1, to: 1, by: -1){
        var a = 0
        var b = i-1
        print("I is \(i)")
        while a < b {
            print("In while")
            if (arr[a] + arr[b] == arr[i]){
                isPythogorian = true
                break;
            }
            if (arr[a] + arr[b] < arr[i]){
                a = a+1
                b = b-1
            }
            
            // (arr[l] + arr[r] < arr[i])?  l++: r--;
            //a = a+1
            //b = b-1
        }
        if (isPythogorian){break;}
    }
    
    return isPythogorian
}



//To Sort the number in increasing order
func partition(array:inout Array<Int>,start:Int,end:Int) -> Int {
    let pivot = array[end]
    var pIndex = start
    
    for i in start...end-1 {
        if (array[i] <= pivot){
            if (i != pIndex){
                swap(&array[i], &array[pIndex])
            }
            pIndex = pIndex + 1
        }
    }
    if (pIndex != end){
        swap(&array[pIndex], &array[end])
    }
    
    return pIndex
}



func QuickSort(array:inout Array<Int>,p:Int, r:Int) -> Array<Int>{
    
    if (p < r){
        let q = partition(array: &array, start: p, end: r)
        QuickSort(array: &array, p: p, r: q-1)
        QuickSort(array: &array, p: q+1, r: r)
    }
    return array
}
//let sortedArray = QuickSort(array: &arr, p: 0, r: arr.count-1)
//print(sortedArray)
print(isPythogorianTriplet() ?  "Yes": "No")
//print("\(isPythogorianTriplet(array: QuickSort(array: &arr, p: 0, r: arr.count-1)) ? "Yes": "No")")
