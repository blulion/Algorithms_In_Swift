//: Playground - Selection Sort

import UIKit


var arr = [3,10,2,1,4,5]//[23,5,13,7,6,1]//[2,5,3,0,2,3,0,3]//[3,5,2,6,1,7]

/*
 int getMax(int A[], int n)
 {
 int i;
 int max = A[0];
 for (i = 1; i < n; i++){
 if (A[i] > max)
 max = A[i];
 }
 return max;
 }
 
 // Main Radix Sort sort function
 void radixSort(int A[], int n)
 {
 int i,digitPlace = 1;
 int result[n]; // resulting array
 // Find the largest number to know number of digits
 int largestNum = getMax(A, n);
 
 
 //we run loop until we reach the largest digit place
 while(largestNum/digitPlace >0){
 
 int count[10] = {0};
 //Store the count of "keys" or digits in count[]
 for (i = 0; i < n; i++)
 count[ (A[i]/digitPlace)%10 ]++;
 
 // Change count[i] so that count[i] now contains actual
 //  position of this digit in result[]
 //  Working similar to the counting sort algorithm
 for (i = 1; i < 10; i++)
 count[i] += count[i - 1];
 
 // Build the resulting array
 for (i = n - 1; i >= 0; i--)
 {
 result[count[ (A[i]/digitPlace)%10 ] - 1] = A[i];
 count[ (A[i]/digitPlace)%10 ]--;
 }
 
 // Now main array A[] contains sorted
 // numbers according to current digit place
 for (i = 0; i < n; i++)
 A[i] = result[i];
 
 // Move to next digit place
 digitPlace *= 10;
 }
 }
 
 
 */


func getMax(array:Array<Int>) -> Int {
    var maxElement = array[0]
    for i in 1..<array.count {
        if (array[i] > maxElement){
            maxElement = array[i]
        }
    }
    return maxElement
}

func countingSort(array:inout Array<Int>,exp:Int,k:Int) -> Array<Int>{
    
    //var c = Array<Int>()
    //var b = Array<Int>()
    
    //Only max Element required
   // let k = getMax(array: arr)
    //print("K value is \(k.max)")
    var result:Array<Int> = Array(repeatElement(0, count: array.count))
    var count:Array<Int> = Array(repeatElement(0, count: 10)) //Time Complexity: O(k)

    //Time Complexity: O(n) -  n being total no.of elements in an array
    for i in stride(from:array.count-1, to: -1, by: -1) {
        let val = (array[i]/exp)%10
        count[val] = count[val] + 1
    }
    //print("C is \(count)")
    //print("Hello")
    for i in 1..<count.count {  //Time Complexity: O(k)
        count[i] = count[i] + count[i-1]
    }
    print("C is \(count)")
   // print("Hello")
    
    var val = 0
    for j in stride(from:array.count-1, to: -1, by: -1) { //Time Complexity: O(n)
        val = (array[j]/exp)%10;
        result[count[val]-1] = array[j]
        //print(" A[\(j)] = \(array[j]),\n C[\(array[j])] = \(c[array[j]]),\n b[\(c[array[j]])] = \(b[c[array[j]]-1]) \n")
        count[val] = count[val] - 1
    }
    
    for i in 0..<array.count {
        array[i] = result[i]
    }
    
    //for (i = 0; i < n; i++)
    //arr[i] = output[i];
    
    
    return result
}

func radixSort(array:inout Array<Int>,n:Int) -> Array<Int>{
 
    let m = getMax(array: array) //total no.of digits
    //let digit = 0
   // var result = 0
    var exp = 1
    while m/exp > 0{
        countingSort(array: &array,exp:exp,k:m)
        print("Array is \(array)")
        exp *= 10
    
    }
    return array
}



print("Radix Sort: \(radixSort(array: &arr, n: arr.count))")




//print("Counting Sort \(countingSort(array: &arr))")
//print("Find Min Max \(findMinMax(array: arr).min) and \(findMinMax(array: arr).max)")

//print("Selection Sort: \(selectionSort(array: &arr))")



