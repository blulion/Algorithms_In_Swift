//: Playground - Selection Sort

import UIKit

/*
 
 
 
 
*/

//Counting sort is stable because we're not doing any comparisons with other sort. It will maintain the order of the same numbers while sorting.

//Time Complexity: 
//O(K+N)
//K is the max element in the array



//Auxiliary Space: O(1)
//The good thing about selection sort is it never makes more than O(n) swaps and can be useful when memory write is a costly operation.


var arr = [2,5,3,0,2,3,0,3]//[3,5,2,6,1,7]


func countingSort(array:inout Array<Int>) -> Array<Int>{
    
    //var c = Array<Int>()
    //var b = Array<Int>()
    
    //Only max Element required
    let k = findMinMax(array: arr)
    //print("K value is \(k.max)")
    var b:Array<Int> = Array(repeatElement(0, count: array.count))
    var c:Array<Int> = Array(repeatElement(0, count: k.max+1)) //Time Complexity: O(k)

    for i in 0..<array.count { //Time Complexity: O(n) -  n being total no. of elements in an array
        c[array[i]] = c[array[i]] + 1
    }
    //print("Hello")
    for i in 1..<c.count {  //Time Complexity: O(k)
        c[i] = c[i] + c[i-1]
    }
    //print("C is \(c)")
   // print("Hello")
    for j in stride(from:array.count-1, to: -1, by: -1) { //Time Complexity: O(n)
        b[c[array[j]]-1] = array[j]
        //print(" A[\(j)] = \(array[j]),\n C[\(array[j])] = \(c[array[j]]),\n b[\(c[array[j]])] = \(b[c[array[j]]-1]) \n")
        c[array[j]] = c[array[j]] - 1
    }
    return b
}



func findMinMax(array:Array<Int>) -> (min: Int, max:Int){
    
    if (array.count > 0){
        var minIndex = -1
        var maxIndex = -1
        
        var minElement  = array[0]
        var maxElement = array[0]
        for i in 0..<array.count {
            for j in i+1..<array.count {
                if (array[j] < minElement){
                    minElement = array[j]
                    minIndex = j
                }
                else if (array[j] > maxElement){
                    maxElement = array[j]
                    maxIndex = j
                    //print("Max Element is \(maxElement)")
                }
            }
        }
        return (min:array[minIndex],array[maxIndex])
    }
    return (min:-1,-1)
}

print("Counting Sort \(countingSort(array: &arr))")
//print("Find Min Max \(findMinMax(array: arr).min) and \(findMinMax(array: arr).max)")

//print("Selection Sort: \(selectionSort(array: &arr))")



