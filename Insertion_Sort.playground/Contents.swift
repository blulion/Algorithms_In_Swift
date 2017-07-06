//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

var arr = [4, 2, 1, 5, 7, 6]//[3,5,2,6,1,7]

func insertionSort(array:inout Array<Int>) -> Array<Int>{
    for j in 1..<array.count {//1,2
        let key = array[j]//5,2
        var i = j-1//0,1
        
        while (i > -1 && array[i] > key){
            array[i+1] = array[i]
            i = i-1
        }
        array[i+1] = key
    }
    return array
}

print("Insertion Sort: \(insertionSort(array: &arr))")

//i/p: 3,5,2,6,1,7
//o/p: 7,6,5,3,2,1
func reverseInsertionSort(array:inout Array<Int>) -> Array<Int>{
    for j in 1..<array.count {//1,2
        let key = array[j]//5,2
        var i = j-1//0,1
        
        while (i > -1 && array[i] < key){
            array[i+1] = array[i]
            i = i-1
        }
        array[i+1] = key
    }
    return array
}
print("Reverse Insertion Sort: \(reverseInsertionSort(array: &arr))")



