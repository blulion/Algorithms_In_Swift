//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

var arr = [3,41,52,26,38,57,9,49]//[5,2,4,7,1,3,2,6]//[4, 2, 1, 5, 7, 6]

//0,7


func mergeWithOutSentinals(array: inout [Int], p:Int, q:Int, r:Int) -> [Int]{
    //print("P: \(p), Q:\(q), R:\(r)")
    let n1 = q - p + 1
    let n2 = r - q
    //print("N1: \(n1) and N2: \(n2)")
    var L:Array<Int> = Array(repeatElement(0, count: n1)),R:Array<Int> = Array(repeatElement(0, count: n2))
    for i in 0..<n1 {
        L[i] = array[p+i]
    }
    
    for j in 0..<n2 {
        R[j] = array[q+j+1]
    }
 
    var i = 0
    var j = 0
    var kl = p
    for k in p..<r {
       // print("P Value is \(p) and R Value is \(r)")
        if L[i] <= R[j] {
            array[kl] = L[i]
            i = i + 1
        }
        else{
            array[kl] = R[j]
            j = j + 1
        }
        kl += 1
    }
    //print("K is \(kl)")
    //Copy remaining elements into main array
    while (i < n1)
    {
        //print("Don't enter");
        array[kl] = L[i];
        i += 1;
        kl += 1 ;
    }
    
    /* Copy the remaining elements of R[], if there
     are any */
    while (j < n2)
    {
        array[kl] = R[j];
        j += 1;
        kl += 1 ;
    }
    //print("Array 2 : \(array)")
    return array
}

func merge(array:inout [Int], p:Int,  q:Int,  r:Int) -> [Int]{
    //print("P: \(p), Q:\(q), R: \(r)")
    let n1 = q - p + 1
    let n2 = r - q
    //print("N1: \(n1) and N2: \(n2)")
    var L:Array<Int> = Array(repeatElement(0, count: n1)),R:Array<Int> = Array(repeatElement(0, count: n2))
    for i in 0..<n1 {
        L[i] = array[p+i]
    }
    

    for j in 0..<n2 {
        R[j] = array[q+j+1]
    }
    
    
    
    
    L.append(Int.max)
    R.append(Int.max)
    //print("Left Array: \(L)")
    //print("Right Array: \(R)")
    //print("Array 1: \(array)")
    var i = 0
    var j = 0
    
    for k in p...r {
        //print("P Value is \(p) and R Value is \(r)")
        if L[i] <= R[j] {
            array[k] = L[i]
            i = i + 1
        }
        else{
            //print("H1: \(array) and P:\(p) and R:\(r)")
            array[k] = R[j]
            j = j + 1
            //print("H2: \(array) and P:\(p) and R:\(r)")
        }
    }
    //print("Array 2: \(array) \n")
    return array
}

func mergeSort(array: inout [Int], p:Int, r:Int) -> [Int]{
    if (p < r){
        let q = p + (r-p)/2
       // print("1: P: \(p), Q: \(q), R:\(r)")
        mergeSort(array: &array, p: p, r: q)
        //print("2: P: \(p), Q: \(q), R:\(r)")
        mergeSort(array: &array, p: q+1, r: r)
        //print("2: P: \(p), Q: \(q), R:\(r)")
        merge(array: &array, p: p, q: q, r: r)
        //mergeWithOutSentinals(array: &array, p: p, q: q, r: r)
    }
    return array
}






print("Sorted Merge result is \(mergeSort(array: &arr,p: 0,r: arr.count-1))")


//var arr1 = [1, 2, 3]
//
//func addItem(_ localArr: inout [Int]) {
//    localArr.append(4)
//}
//
//addItem(&arr1)
//print(arr1)

/*func insertionSort(array:inout Array<Int>) -> Array<Int>{
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

print("Insertion Sort: \(insertionSort(array: &arr))")*/


/*
 Hashable Protocol
 
class User: Hashable {
    var uid: Int
    var name: String
    var hashValue: Int {
        return self.uid.hashValue
    }
    
    init(uid: Int, name: String) {
        self.uid = uid
        self.name = name
    }
}

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.uid.hashValue == rhs.uid.hashValue
}


let user1 = User(uid: 1, name: "Bill")
let user2 = User(uid: 2, name: "Jay")
let user3 = User(uid: 1, name:"Anish")
print("Hash Value 1: \(user1.hashValue) and Hash Value 2: \(user2.hashValue) and Hash Value 3: \(user3.hashValue)")
var user_arrays: [User:String] = [
    user1:"The sky above the port was the color of television, tuned to a dead channel.",
    user2:"In a hole in the ground there lived a hobbit."
]

print("Is Equal: \(user1 == user3)")*/





let s = "12:01:01PM"
let sarr = s.components(separatedBy: ":")
var timeFormat = sarr[2]

let secondsRange = timeFormat.startIndex..<timeFormat.index(timeFormat.endIndex, offsetBy: -2)
let seconds = timeFormat[secondsRange]
let hourrange = timeFormat.index(timeFormat.startIndex, offsetBy: 2)..<timeFormat.endIndex
let hourFormat = timeFormat[hourrange]
//print("Time Format: \(timeFormat[range])")
//print("Format: \(format)")
if (hourFormat == "AM"){
    if (Int(sarr[0]) == 12){
        print("00:\(sarr[1]):\(seconds)")
    }
    else{
      print("\(sarr[0]):\(sarr[1]):\(seconds)")
    }
}
else{
    if (Int(sarr[0]) == 12){
        print("\(sarr[0]):\(sarr[1]):\(seconds)")
    }else{
        print("\((Int(sarr[0]))!+12):\(sarr[1]):\(seconds)")
    }
}
