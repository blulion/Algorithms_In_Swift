//: Playground - noun: a place where people can play

import UIKit

/*
Given an array, print k largest elements from the array.  The output elements should be printed in decreasing order.

Input:

The first line of input contains an integer T denoting the number of test cases.
The first line of each test case is N and k, N is the size of array and K is the largest elements to be returned.
The second line of each test case contains N input C[i].

Output:

Print the k largest element in descending order.

Constraints:

1 ≤ T ≤ 50
1 ≤ N ≤ 100
K ≤ N
1 ≤ C[i] ≤ 1000

Example:

Input:
2
5 2
12 5 787 1 23
7 3
1 23 12 9 30 2 50

Output:
787 23
50 30 23

*/

/* 
 Solution:
  Create a empty array (tempArray)
  while looping through given array, add elements into tempArray till it reach k (max number of elements)
 
    when tempArray reach max no. of elements (i.e) K elements, then find the minimum element in the tempArray and if the minimum element is less than input array element (at index i), then replace the minimum element with input array element.
 
    Sort the tempArray using QuickSort.
 
 */


var array = [335,501,170,725,479,359,963,465,706,146,282,828,962,492,996,943,828,437,392,605,903,154,293,383, 422,717,719,896,448,727,772,539,870,913,668,300,36,895,704,812,323,334]//[5,12,787,1,23]//[1,23,12,9,30,2,50]//

func kLargestElements(k:Int,array:Array<Int>) -> Array<Int>?{
    print("Array count is \(array.count)")
    if (array.count > 0 && k <= array.count){
        var tempArray:Array<Int> = []//Array(repeating: -1, count: k)
        
        var i = 0
        while i < array.count {
            if (tempArray.count <= k){
                tempArray.append(array[i])
            }
            else{
                let minValueIndex = findMinVal(tArray: tempArray)
                
                if (minValueIndex != -1 && tempArray[minValueIndex] < array[i]){
                    tempArray[minValueIndex] = array[i]
                }
            }
            i += 1
        }
        return QuickSort(array: &tempArray, p: 0, r: tempArray.count-1)
    }
    return nil
    
}

//Return Min Value Index
func findMinVal(tArray:Array<Int>) -> Int {
    var index = -1
    if (tArray.count > 0){
        var minValue = tArray[0]
        index = 0
        for i in 1..<tArray.count {
            if (tArray[i] < minValue){
                minValue = tArray[i]
                index = i
            }
        }
    }
    return index
}

//Sorting an array in descending order

func partition(array:inout Array<Int>,start:Int,end:Int) -> Int {
    let pivot = array[end]
    var pIndex = start
    
    for i in start...end-1 {
        if (array[i] >= pivot){
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



print("K Largest Elements \(kLargestElements(k: 30, array: array)!)")





