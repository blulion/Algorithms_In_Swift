//: Playground - noun: a place where people can play

import UIKit

/*
 
 First Pass:
 ( 5 1 4 2 8 ) –> ( 1 5 4 2 8 ), Here, algorithm compares the first two elements, and swaps since 5 > 1.
 ( 1 5 4 2 8 ) –>  ( 1 4 5 2 8 ), Swap since 5 > 4
 ( 1 4 5 2 8 ) –>  ( 1 4 2 5 8 ), Swap since 5 > 2
 ( 1 4 2 5 8 ) –> ( 1 4 2 5 8 ), Now, since these elements are already in order (8 > 5), algorithm does not swap them.
 
 Second Pass:
 ( 1 4 2 5 8 ) –> ( 1 4 2 5 8 )
 ( 1 4 2 5 8 ) –> ( 1 2 4 5 8 ), Swap since 4 > 2
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –>  ( 1 2 4 5 8 )
 
 Now, the array is already sorted, but our algorithm does not know if it is completed. 
 The algorithm needs one whole pass without any swap to know it is sorted.
 
 Third Pass:
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 
 */


var arr = [3,26,52,49]//[52,3,26,49]//[52,26,38,57,9,49,3,41]//[3,5,2,6,1,7]

func bubbleSort(array:inout Array<Int>) -> Array<Int>{
    for i in 0...array.count-1 {
        for j in stride(from:array.count-1, to: 0, by: -1) where j > i{
            if (array[j] < array[j-1]){
                swap(&array[j],&array[j-1])
            }
        }
    }
    return array
}

//[52,3,26,49]
//[3,52,26,49]
//[3,26,52,49]
//[3,26,49,52]

//If there is no at least 1 swap happened, then it means there is nothing to swap or sort in an array. Array is already sorted
func optimizedBubbleSort(array:inout Array<Int>) -> Array<Int>{
    var swapped = false;
    for i in 0...array.count-1 {
        swapped = false;
        for j in stride(from:array.count-1, to: 0, by: -1) where j > i{
            //print("i is \(i) and j is \(j) and array[j] = \(array[j]) and array[j-1] = \(array[j-1])")
            
            if (array[j] < array[j-1]){
                print("Swapped")
                swap(&array[j],&array[j-1])
                swapped = true
            }
        }
        if (swapped == false){break;}
    }
    return array
}

func swap(a:inout Int,b:inout Int){
    let temp = a
    a = b
    b = temp
}


//func recursiveBubbleSort(array:UIPrintInfoOutputType Array<Int>) -> Array<Int>{

//}


//print(bubbleSort(array: &arr))
print(optimizedBubbleSort(array: &arr))
