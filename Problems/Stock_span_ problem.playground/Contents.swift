//: Playground - noun: a place where people can play

import UIKit

/*
The stock span problem is a financial problem where we have a series of n daily price quotes for a stock and we need to calculate span of stock’s price for all n days.
The span Si of the stock’s price on a given day i is defined as the maximum number of consecutive days just before the given day, for which the price of the stock on the current day is less than or equal to its price on the given day.
For example, if an array of 7 days prices is given as {100, 80, 60, 70, 60, 75, 85}, then the span values for corresponding 7 days are {1, 1, 1, 2, 1, 4, 6}

Input:

The first line of input contains an integer T denoting the number of test cases.
The first line of each test case is N,N is the size of array.
The second line of each test case contains N input C[i].

Output:

Print the span values.
*/
//http://practice.geeksforgeeks.org/problems/stock-span-problem/0

let arr = [100,80,60,70,60,75,85]


var j = 0
var count = 1
for i in 0..<arr.count {
    j = i-1
    count = 1
    while j >= 0 {
        if (arr[j] <= arr[i]){
            count += 1
            j = j-1
        }
        else{
            break;
        }
    }
    print("\(count) \n")
}




