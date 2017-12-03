//: Playground - noun: a place where people can play

import UIKit


/*
 
 Heapify(array A, int i, int m) { // sift down A[i] in A[1..m]
	l = Left(i) // left child
	r = Right(i) // right child
	max = i
	if (l <= m and A[l] > A[max]) max = l // left child exists and larger
	if (r <= m and A[r] > A[max]) max = r // right child exists and larger
 
	if (max != i) { // if either child larger
 swap A[i] with A[max] // swap with larger child
 Heapify(A, max, m) // and recurse
	}
 }
 
 
 Build Heap:
 
 BuildHeap(int n, array A[1..n]) { // build heap from A[1..n]
	for i = n/2 downto 1 {
 Heapify(A, i, n)
	}
 }
 
 
 Heap Sort:
 
 HeapSort(int n, array A[1..n]) { // sort A[1..n]
	BuildHeap(n, A) // build the heap
	m = n // initially heap contains all
	while (m >= 2) {
 swap A[1] with A[m] // extract the m-th largest
 m = m-1
 Heapify(A, 1, m) // fix things up
	}
 }
 
 */
var arr = [52,26,38,57,9,49,3,41]//[4, 2, 1, 5, 7, 6]

func heapify(array:inout Array<Int>, n:Int, i:Int){
    var largest = i
    let left = 2*i + 1
    let right = 2*i + 2
    
    if (left < n && array[left] > array[largest]){
        largest = left
    }
    
    if (right < n && array[right] > array[largest]){
        largest = right
    }
    
    if (largest != i){
        swap(&array[i], &array[largest])
        heapify(array: &array, n: n, i: largest)
    }
}


//This function is called only once to keep the max element in the root node.
func BuilD_HEAP(array:inout Array<Int>, n:Int){
    for i in stride(from: (n/2)-1, to: -1, by: -1) {
        //print("i value is \(i) and n value is\((n/2)-1)")
        heapify(array: &array, n: n, i: i)
    }
    //print("BUILD_HEAP \(array)")
}


func heapSort(array:inout Array<Int>,n:Int) -> Array<Int>{
    
    BuilD_HEAP(array: &array, n: n)
    var m = n-1
    while m > 1 {
        swap(&array[0], &array[m])
        m = m - 1
        heapify(array: &array, n: m, i: 0)
    }

    return array
}

print("Heap Sort of Numbers \(arr) is \n \(heapSort(array: &arr, n: arr.count))")


