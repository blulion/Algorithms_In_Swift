//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"


//Problem 1:
//Interviewer: Amazon

//Modify contents of Linked List

/*
    Sort Linked List
 
    Approach: Merge Sort
 
 */

/*
 Input : 10 -> 4 -> 5 -> 3 -> 6
 Output : 3 -> 4 -> 5 -> 6 -> 10
 
 */


class Node<T: Equatable>{
    var value: T? = nil
    var next: Node? = nil
}


class LinkedList<T: Equatable>{
    //var head:Node<T>? = nil
    
    init() {
        
    }
    
    
    func push(head:inout Node<T>?,value:T){
        let newNode = Node<T>()
        newNode.value = value
        newNode.next = nil
        
        var last = head
        if (head == nil){
            head = newNode;
            return
        }
        
        while last?.next != nil {
            last = last?.next
        }
        
        last?.next = newNode
    }
    
    func frontBackSplit(list:inout Node<T>?)->(front:Node<T>?,back:Node<T>?){
        var slow = list
        var fast = slow?.next
        while (fast != nil){
            fast = fast?.next
            if (fast == nil){break;}
            fast = fast?.next
            if (fast != nil){
                slow = slow?.next
            }
        }
        
        let toReturn = slow?.next
        slow?.next = nil
        return (list,toReturn)
    }
    
    
    
    func printAll(head:inout Node<T>?){
        var current:Node? = head
        var valueString:String = ""
        while (current != nil) {
           // valueString = add(num1: valueString, "\(current!.value!) ")
            valueString = valueString + " \(current!.value!) "
            current = current?.next;
        }
        print("\(valueString)")
    }
 
    
    
    func sortedMerge(a:Node<T>?,b:Node<T>?) -> Node<T>?{
        
        if (a == nil){
            return b
        }
        else if (b == nil){
            return a
        }
        //print("A: \(a!.value!) and B: \(b!.value!)")
        var result:Node<T>?
        
        if ((a!.value! as! Int) <= (b!.value! as! Int)){
            result = a
            result?.next = sortedMerge(a: a?.next, b: b)
        }
        else{
            result = b
            result?.next = sortedMerge(a: a, b: b?.next)
        }
        return result
    }
    
    func mergeSort(headref:inout Node<T>?) -> Node<T>? {
        
        var head = headref
        var a:Node<T>?
        var b:Node<T>?
        
        if (head == nil || head?.next == nil){
            return head
        }
        let result = frontBackSplit(list: &head)
        a = result.front
        b = result.back
        
        //print("A: \(a!.value!) and B: \(b!.value!)")
        //print("B Value: \(b!.value!)")
        
        a = mergeSort(headref: &a)
        b = mergeSort(headref: &b)
        head =  sortedMerge(a: a, b: b)
        return head
    }

    
}
//2 -> 9 -> 8 -> 12 -> 7 -> 10
var linkedList = LinkedList<Int>()
var head:Node<Int>? = nil
//Head always point to the first
linkedList.push(head: &head, value: 3)
linkedList.push(head: &head, value: 5)
linkedList.push(head: &head, value: 2)
linkedList.push(head: &head, value: 6)
linkedList.push(head: &head, value: 4)
linkedList.push(head: &head, value: 1)
linkedList.push(head: &head, value: 7)
linkedList.printAll(head: &head)

head = linkedList.mergeSort(headref: &head)

linkedList.printAll(head: &head)





