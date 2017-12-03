//: Playground - noun: a place where people can play

import UIKit

/*
 
 73
 67
 38
 33
 Sample Output 0
 
 75
 67
 40
 33
 */


func calculateGrade(grade:Int) -> Int {
    var gradeValue = grade
    if (grade < 38){
        gradeValue = grade
    }
    else{
        let value = gradeValue % 5
        let newValue = grade + (5 - value)
        if (value != 0 && newValue-gradeValue < 3){
            gradeValue = newValue
        }
    }
    return gradeValue
}


//print(calculateGrade(grade: 33))


//https://www.hackerrank.com/challenges/apple-and-orange?h_r=next-challenge&h_v=zen



/*int searchNumOccurrence(vector<int> &V, int k, int start, int end) {
    if (start > end) return 0;
    int mid = (start + end) / 2;
    if (V[mid] < k) return searchNumOccurrence(V, k, mid + 1, end);
    if (V[mid] > k) return searchNumOccurrence(V, k, start, mid - 1);
    return searchNumOccurrence(V, k, start, mid - 1) + 1 + searchNumOccurrence(V, k, mid + 1, end);
}*/

var array = [4, 2, 1, 5, 7, 6, 8, 10, 15, 75, 22, 16, 64, 55, 92]
func searchNumOccurrence(V:inout Array<Int>, k:Int, start:Int, end: Int) -> Int{
    if (start > end) {return 0};
    var mid = (start + end) / 2;
    if (V[mid] < k) {return searchNumOccurrence(V, k, mid + 1, end)};
    if (V[mid] > k) {return searchNumOccurrence(V, k, start, mid - 1)};
    return searchNumOccurrence(V, k, start, mid - 1) + 1 + searchNumOccurrence(V, k, mid + 1, end);
}

print("Number is \(searchNumOccurrence(V: &array, k: 3, start: 0, end: array.count-1))")





