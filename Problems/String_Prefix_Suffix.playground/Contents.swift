//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"


//Problem 1:
//Interviewer: Hacker Earth

//Modify contents of Linked List

/*
 Rob needs to give a string to each of his students. There is huge string S that is known to all. He doesn't want to work much, hence decides to give each of them, some prefix of S.
 Now, the students consider their strings holy, if their string is very similar to this known string S. Now, this similarity comparison is done from suffix matching.
 So, now you are to help in this computation. So, given an integer i, find the longest matching suffix in between S[1...i] and S.
 
 */

/*
 Input:
 The first line contains string S. The next line contains q, the number of queries. Each of the following q lines contain a number i, denoting the query.
 Output:
 Output q lines each containing the answer as explained above.
 Constraints:
 1 <= |S| <= 200000
 1 <= q <= |S|
 1 <= i <= |S|
 
 
 Sample Input
 
 ababa
 5
 1
 2
 3
 4
 5
 Sample Output
 
 1
 0
 3
 0
 5


 */

/*
 
 let s = String(readLine()!)!
 let n = Int(readLine()!)!
 var testCases = [Int]()
 for i in 0 ..< n {
 let line = Int(readLine()!)! // Read a single line
 testCases.append(line)
 }
 
 var j = 1
 var count = 0
 
 for t in 1...testCases.count {
 let start =  s.startIndex//s.index(s.endIndex, offsetBy: -t)
 let end = s.index(s.startIndex,offsetBy:t)//s.index(s.endIndex, offsetBy: -4)
 let substring = s[start..<end]
 //print("Substring is \(substring)")
 j = 1
 count = 0
 for i in substring.characters.reversed(){//stride(from: substring.characters.count-1, to: 0, by: -1){
 //print("Value is \(s)")
 //ababa
 let suffixStart = s.index(s.endIndex,offsetBy:-j)
 let suffixEnd = s.index(s.endIndex,offsetBy:-j+1)
 let character = s[suffixStart..<suffixEnd]
 print("Character is \(character)")
 
 if (String(i) != character){
 count = 0
 break;
 }
 else{
 count = count + 1;
 j = j + 1;
 }
 }
 print("\(count)")
 print("------------------------")
 }
 
 
 */




