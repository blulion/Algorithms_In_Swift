//: Playground - noun: a place where people can play

import UIKit

/*
 Given a set of strings print the set sorted according to their size. If the size of the strings are equal, must maintain the original order of the set.
 
 Input :
 
 The first line of input has an integer T that indicates the number of sets of strings, each set may contain between 1 and 50 inclusive elements, and each of the strings of the set may contain between 1 and 50 inclusive characters('a' to 'z').
 
 Output:
 
 The output should contain the set of input strings ordered by the length of strings.A blank space must be printed between two words.
 
 Sample Input:
 
 3
 ab cd e j asd ljffg df
 a a b b c c
 xy yx zxy zx xzy xxx
 
 
 Sample Output:
 
 e j ab cd df asd ljffg
 a a b b c c
 xy yx zx zxy xzy xxx
 
 
 */

var arr = ["xy","yx","zxy","zx","xzy","xxx"]//["a","a","b","b","c","c"]//["ab","cd","e","j","asd","ljffg","df"]

let arrString = "ab cd e j asd ljffg df"
print("Value is \(arrString.components(separatedBy: " "))")

//Quick Sort Implementation

func partition(array:inout Array<String>,start:Int,end:Int) -> Int{
    let pivot = array[end].characters.count
    var pIndex = start
    for i in start...end-1 {
        if (array[i].characters.count <= pivot){
            print("\(array[i]) <= \(pivot)")
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


func QuickSort(array:inout Array<String>,start:Int,end:Int) -> Array<String>{
    if (start < end){
        let partitionIndex = partition(array: &array, start: start, end: end)
        print("Parition is \(partitionIndex) and array is \(array)")
        QuickSort(array: &array, start: start, end: partitionIndex-1)
        QuickSort(array: &array, start: partitionIndex+1, end: end)
    }
    return array
}
print("Sort: \(QuickSort(array:&arr,start:0,end:arr.count-1))")






