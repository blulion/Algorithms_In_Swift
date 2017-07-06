//: Playground - Selection Sort

import UIKit

/*
 
 Selection Sort: 
    1) Find Minimum Element.
    2) Exchange with the current active Index.
    3) Increment current active Index.
 
 
 arr[] = 64 25 12 22 11
 
 // Find the minimum element in arr[0...4]
 // and place it at beginning
 11 25 12 22 64
 
 // Find the minimum element in arr[1...4]
 // and place it at beginning of arr[1...4]
 11 12 25 22 64
 
 // Find the minimum element in arr[2...4]
 // and place it at beginning of arr[2...4]
 11 12 22 25 64
 
 // Find the minimum element in arr[3...4]
 // and place it at beginning of arr[3...4]
 11 12 22 25 64
 
 
*/

//Time Complexity: O(n2) as there are two nested loops.

//Auxiliary Space: O(1)
//The good thing about selection sort is it never makes more than O(n) swaps and can be useful when memory write is a costly operation.


var arr = [3,5,2,6,1,7]//[64, 25, 12, 22, 11]//[3,5,2,6,1,7]


func selectionSort(array:inout Array<Int>) -> Array<Int>{
    for i in 0..<arr.count {
        var min  = arr[i]
        var index = -1
        for j in i+1..<arr.count {
            if (arr[j] < min){
                min = arr[j]
                index = j
            }
        }
        
        if (index != -1){
            swap(&arr[i], &arr[index])
        }
    }
    return arr
}

func swap(a:inout Int, b:inout Int){
    var temp = a
    b =  a
    a = temp
}

print("Selection Sort: \(selectionSort(array: &arr))")



