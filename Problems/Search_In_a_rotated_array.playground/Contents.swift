//: Playground - noun: a place where people can play

import UIKit

//Note: Arr is an Sorted array
//Time Complexity: O(logn)
//Auxillary Space: O(1) in case of iterative implementation. 
//In case of recursive implementation, O(Logn) recursion call stack space.

//Note: BST applied only to the sorted array.
//         0 1 2 3 4 5
let arr = [5,7,1,2,3,4];
//[5,7,1,2,3,4];
//[1,2,3,4,5,7]
//[2,3,4,5,7,1]


func binarySearch(l:Int,r:Int,x:Int) -> Int{
    if (l <= r){
        
        //Here to calculate mid, we used l + (r - l)/2. But why we didn't use (l + r)/2. Because for large set of array. It may cause overflow. Suppose consider you have a very big array whose length is equal to 3/4  number of elements of 32 bit integer. So when you calculate  (l + r)/2. The  (l + r) can exceed the size of the 32 bit integer which causes overflow. Inorder to avoid that we use 'l + (r-l)/2'
        
        let mid = l + (r-l)/2
        
        if (x == arr[mid]){
            return mid
        }
            
        else if (x > arr[mid]){
            return binarySearch(l: mid+1, r: r, x: x)
        }
        else{
            return binarySearch(l: l, r: mid, x: x)
        }
    }
    return -1
}


func findPivot(l: Int, h: Int) -> Int {
    if (h < l) {return -1}
    if (h == l){return l}
    
    let mid = l + (h-l)/2;

    if (mid < h && arr[mid] > arr[mid+1]){
        return mid;
    }
    
    if (mid > l && arr[mid] < arr[mid-1]){
        return mid-1;
    }
    
    if (arr[l] >= arr[mid]){
        return findPivot(l: l, h: mid-1);
    }
    return findPivot(l: mid+1, h: h);
}


func pivotedBinarySearch(arr: Array<Int>, n: Int, k: Int) -> Int{
    let pivot = findPivot(l: 0, h: n-1)
    print("Pivot: \(pivot)");
    if (pivot == -1){
        return binarySearch(l: 0, r: n-1, x: k)
    }
    
    if (arr[pivot] == k){
        return pivot
    }
    if (arr[0] <= k){
        return binarySearch(l: 0, r: pivot-1, x: k)
    }
    return binarySearch(l: pivot+1, r: n-1, x: k);
}

//           0 1 2 3 4 5
//let arr = [5,7,1,2,3,4]

print(pivotedBinarySearch(arr: arr, n: arr.count-1, k: 9));




/*
 if (l <= r){
 
 //print("1");
 let mid = l + (r - l)/2;
 //print("l: \(l), r: \(r), mid: \(mid)");
 if (mid == 0 || mid == arr.count-1){
 //print("2");
 return mid;
 }
 else if (mid-1 >= l && arr[mid] < arr[mid-1]){
 //print("3");
 return mid;
 }
 else if (mid+1 <= r && arr[mid+1] < arr[mid]){
 // print("4");
 return mid+1;
 }
 // else if (x > arr[mid]){
 else if (arr[mid] < arr[mid-1]){
 
 }
 else{
 //print("5");
 return findPivot(l: l, r: mid);
 //print("6");
 // return findPivot(l: mid+1, r: r);
 }
 }
 //print("Values are \(l) and \(r)")
 return -1;
 
 */

//print(findPivot(l: 0, r: arr.count-1) );





