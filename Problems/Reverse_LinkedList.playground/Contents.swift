//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"


//Problem 1:
//Interviewer: Amazon

/* Given a linked list, write a function to reverse every k nodes (where k is an input to the function).If a linked list is given as 1->2->3->4->5->6->7->8->NULL and k = 3 then output will be 3->2->1->6->5->4->8->7->NULL.

Input:
In this problem, method takes two argument: the head of the linked list and int k. You should not read any input from stdin/console.
The struct Node has a data part which stores the data and a next pointer which points to the next element of the linked list.
There are multiple test cases. For each test case, this method will be called individually.

Output:
Reverse the linked list in the group of given size and return the reference of starting node(head) of the reversed Linked list .
    
Note: If you use "Test" or "Expected Output Button" use below example format
Example:
Input:
1
8
1 2 2 4 5 6 7 8
4

Output:
4 2 2 1 8 7 6 5

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
    
    
    func doOperation(head: inout Node<T>?,k:Int) -> Node<T>? {
        
        var prev:Node<T>? = nil
        var current:Node<T>? = head
        var next:Node<T>? = head?.next
        var count = 1
        
        var newHead:Node<T>? = head
        
        while next != nil {
            
            while count%k != 0 && next != nil {
                current = current?.next
                next = current?.next
                count += 1
            }
            current?.next = nil
            var pNext = prev?.next
            var reversedHead:Node<T>? = nil
            
            if (prev != nil){
                 reversedHead = reverseLinkedList(list: &pNext)
            }
            else{
                 reversedHead = reverseLinkedList(list: &head)
                 newHead = reversedHead
            }
            
            
             //check this
            let mergedListResult = mergeList(prev: &prev, head: &reversedHead, next: &next)
            prev = mergedListResult.prev
            current = mergedListResult.head
            next = mergedListResult.next
            count = 1
        }
        return newHead
    }
    
    
    
   /* func splitLinkedList(list:inout Node<T>?)->Node<T>?{
        var last = list
        var runner = last?.next
        while (runner != nil){
            runner = runner?.next
            if (runner == nil){break;}
            runner = runner?.next
            if (runner != nil){
                last = last?.next
            }
        }
        
        let toReturn = last?.next
        last?.next = nil
        return toReturn
    } */
    
    func reverseLinkedList(list:inout Node<T>?)->Node<T>?{
        var prev:Node<T>? = nil
        var current:Node<T>? = list
        var next:Node<T>? = list?.next
        
        while next != nil {
            current?.next = prev
            prev = current
            current = next
            next = current?.next
        }
        current?.next = prev
        
         //print("Node value is \(prev?.value)")
        return current
    }
    
    func mergeList(prev:inout Node<T>?, head:inout Node<T>?,next:inout Node<T>?) -> (prev:Node<T>?,head:Node<T>?,next:Node<T>?){
        
        if (prev != nil){
            prev?.next = head
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        
        prev = current
        if (next != nil){
            current?.next = next
            current = next
            next = current?.next
            //head = current
        }
        return (prev,current,next)
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
//2 -> 9 -> 8 -> 12 -> 7 -> 10
var linkedList = LinkedList<Int>()
var head:Node<Int>? = nil
//Head always point to the first
linkedList.push(head: &head, value: 1)
linkedList.push(head: &head, value: 2)

//print("head value is \(head?.value)")
linkedList.push(head: &head, value: 3)
linkedList.push(head: &head, value: 4)
linkedList.push(head: &head, value: 5)
linkedList.push(head: &head, value: 6)
linkedList.push(head: &head, value: 7)
linkedList.push(head: &head, value: 8)
linkedList.push(head: &head, value: 9)
linkedList.push(head: &head, value: 10)
linkedList.push(head: &head, value: 11)
linkedList.push(head: &head, value: 12)
linkedList.push(head: &head, value: 13)
linkedList.push(head: &head, value: 14)
linkedList.push(head: &head, value: 15)
linkedList.push(head: &head, value: 16)
linkedList.push(head: &head, value: 17)
linkedList.push(head: &head, value: 18)
linkedList.push(head: &head, value: 19)
linkedList.push(head: &head, value: 20)


//linkedList.push(head: &head, value: 6)
linkedList.printAll(head: &head)
//var newHead = linkedList.doOperation(head: &head, k: 5)
//print("Head Value is \(head!.value!) and New Head Value is \(newHead!.value!)")
//linkedList.printAll(head: &newHead)

//var toReturn = linkedList.splitLinkedList(list: &head)
//linkedList.printAll(head: &toReturn)
//var node = linkedList.reverseLinkedList(list: &toReturn)



