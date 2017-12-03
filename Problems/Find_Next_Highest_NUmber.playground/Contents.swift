//: Playground - noun: a place where people can play

import Foundation

//http://www.ardendertat.com/2012/01/02/programming-interview-questions-24-find-next-higher-number-with-same-digits/

/*
 Problem Statement:
     For the number 123, the next highest number is 132 and not 231 , 312, etc.,
 
 Approach:
 Let’s visualize a better solution using an example, the given number is 12543 and the resulting next higher number should be 13245. We scan the digits of the given number starting from the tenths digit (which is 4 in our case) going towards left. At each iteration we check the right digit of the current digit we’re at, and if the value of right is greater than current we stop, otherwise we continue to left. So we start with current digit 4, right digit is 3, and 4>=3 so we continue. Now current digit is 5, right digit is 4, and 5>= 4, continue. Now current is 2, right is 5, but it’s not 2>=5, so we stop. The digit 2 is our pivot digit. From the digits to the right of 2, we find the smallest digit higher than 2, which is 3. This part is important, we should find the smallest higher digit for the resulting number to be precisely the next higher than original number. We swap this digit and the pivot digit, so the number becomes 13542. Pivot digit is now 3. We sort all the digits to the right of the pivot digit in increasing order, resulting in 13245.

 */

print("Hello World")

func nextHighestNumber(number: String) -> String{
    var array = number.flatMap{Int(String($0))}
    var i = array.count - 2
    while i > 0 {
        if (array[i] < array[i+1]){
            let nextIndex = findNextIndex(value: array[i], index: i, array:array)
            let temp = array[i]
            array[i] = array[nextIndex]
            array[nextIndex] = temp
            array = sortArray(array: &array, fromIndex: i+1)
            break
        }
        i = i-1
    }
    
    print("Array: \(array)")
    return String(array.flatMap({String($0)}))
}

func findNextIndex(value: Int, index: Int, array: Array<Int>) -> Int{
    let minVal = value
    var maxVal = 9
    var returnedIndex = index+1
    for i in index+1 ..< array.count-1 {
        if (array[i] > minVal && array[i] < maxVal){
            maxVal = array[i]
            returnedIndex = i
        }
    }
    return returnedIndex
}

func sortArray(array:inout Array<Int>,fromIndex: Int) -> Array<Int>{
    let toSort = array.suffix(from: fromIndex)
    let sorted = toSort.sorted()
    let slicedArray = array.dropLast(toSort.count)
    return slicedArray + sorted
}

print(nextHighestNumber(number:"123"))

