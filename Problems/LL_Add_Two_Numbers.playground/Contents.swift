//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"


//Problem 1:
//Interviewer: Amazon

/* Given two numbers represented by two lists, write a function that returns sum list. The sum list is list representation of addition of two input numbers.
 
 Suppose you have two linked list 5->4 ( 4 5 )and 5->4->3( 3 4 5) you have to return  a resultant linked list 0->9->3 (3 9 0).
 
 (i.e) 45 + 345 = 390
 
 Input:
 
 In this problem, method takes two argument: the head of the first and second linked list. The function should not read any input from stdin/console.
 The struct Node has a data part which stores the data and a next pointer which points to the next element of the linked list.
 There are multiple test cases. For each test case, this method will be called individually.
 
 Output:
 Add  two numbers represented by linked lists.
 
 Note: If you use "Test" or "Expected Output Button" use below example format
 Constraints:
 
 1<=T<=100
 
 1<=N<=100
 Example:
 
 Input:
 
 2
 
 2
 
 4 5
 
 3
 
 3 4 5
 
 2
 
 6 3
 
 1
 
 7
 
 Output:
 
 0 9 3 
 
 0 7

 
 My Approach:
   1) Reverse the linked list and find the exact no.
        for eg: if the linked list is 4 -> 5. then while reversing, get the actual no (i.e) 45
   2) Add those 2 numbers, split the result and reverse the number
 
 */


class Node<T: Equatable>{
    var value: T? = nil
    var next: Node? = nil
}

class LinkedList<T: Equatable>{
    //var head:Node<T>? = nil
    
    var last:Node<T>? = nil
    
    init() {
        
    }
    
    func push(head:inout Node<T>?,value:T){
        let newNode = Node<T>()
        newNode.value = value
        newNode.next = nil
        
        //var last = head
        if (head == nil){
            head = newNode;
            last = head;
            return
        }
        
        while last?.next != nil {
            last = last?.next
        }
        
        last?.next = newNode
        last = last?.next
    }
    
    func addLinkedList(head1:inout Node<T>?, head2: inout Node<T>?) -> Node<T>? {
        //5 4 3 +  5 4
        let r1 = self.reverseLinkedList(list: &head1)
        let r2 = self.reverseLinkedList(list: &head2)
        //let reversedHead1 = r1.node// 3 4 5
        //let reversedHead2 = r2.node // 4 5
        
        let n1 = r1.result// 345
        let n2 = r2.result //45
        
        //print("N1: \(n1) and N2: \(n2)")
        
        let sum = n1 + n2 //390
        let exp = 10
        var result = sum // 390
        var resultHead:Node<T>? = nil
        //print("Sum is \(sum)")
        while  result/exp >= 0 && result != 0{
            let modVal:T = result%exp as! T
            self.push(head: &resultHead, value: modVal)
            result = result/exp //39,3
        }
        
        //let finalResultList = self.reverseLinkedList(list: &resultHead)
        return resultHead
    
    }
    
    
    func reverseLinkedList(list:inout Node<T>?)->(node:Node<T>?,result:Int){
        var prev:Node<T>? = nil
        var current:Node<T>? = list
        var next:Node<T>? = list?.next
        //5 4 3 = 345
        var number = (list!.value as! Int)
        var precision = 1
        while next != nil {
            current?.next = prev
            prev = current
            current = next
            next = current?.next
            precision *= 10
            number += (current!.value as! Int)*precision
        }
       // print("Number is \(number)")
        current?.next = prev
        
        return (current,number)
    }
    
    func printAll(head:inout Node<T>?){
        var current:Node? = head
        var valueString:String = ""
        while (current != nil) {
            //valueString = add(num1: valueString, "\(current!.value!) ")
            valueString = valueString + " \(current!.value!)"
            current = current?.next;
        }
        print("Value is \(valueString)")
    }
}


//345 + 45

// 5 -> 4 -> 3 + 5 -> 4
//3 -> 4 -> 5 + 4 -> 5


//2 -> 9 -> 8 -> 12 -> 7 -> 10
var linkedList = LinkedList<Int>()
var head1:Node<Int>? = nil
var head2:Node<Int>? = nil

//Head always point to the first
linkedList.push(head: &head1, value: 6)
linkedList.push(head: &head1, value: 3)
//linkedList.push(head: &head1, value: 3)


linkedList.push(head: &head2, value: 7)
//linkedList.push(head: &head2, value: 4)
var answer = linkedList.addLinkedList(head1: &head1, head2: &head2)
//linkedList.push(head: &head, value: 6)
//print("Value is \(answer)")
linkedList.printAll(head: &answer)
