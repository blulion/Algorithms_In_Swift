//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"


//Problem 1:
//Interviewer: Amazon

//Modify contents of Linked List

/*
    Given a singly linked list containing n nodes. Modify the value of first half nodes such that 1st node’s new value is equal to the last node’s value minus first node’s current value, 2nd node’s new value is equal to the second last node’s value minus 2nd node’s current value, likewise for first half nodes. If n is odd then the value of the middle node remains unchanged.
 
 */

/*
 Input : 10 -> 4 -> 5 -> 3 -> 6
 Output : 4 -> 1 -> 5 -> 3 -> 6
 
 Input : 2 -> 9 -> 8 -> 12 -> 7 -> 10
 Output : -8 -> 2 -> -4 -> 12 -> 7 -> 10

 */


class Node<T: Equatable>{
    var value: T? = nil
    var next: Node? = nil
}


protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}

func add<T: Addable>(num1: T, _ num2: T) -> T {
    return num1 + num2
}

protocol Subtract{
    static func -(lhs:Self, rhs:Self) -> Self
}

func sub<T:Subtract>(num1:T,_ num2:T) -> T{
    return num1 - num2
}

extension String:Addable{}
extension Int:Subtract{}
extension Double:Subtract{}
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
    
    func splitLinkedList(list:inout Node<T>?)->Node<T>?{
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
    }
    
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
    
    func calcuateDifferenceAndMerge(head1:Node<T>?,head2:Node<T>?){
        var l1 = head1
        var l2 = head2
        
        while l1 != nil {
            let value = sub(num1: (l1?.value as! Int), (l2?.value as! Int))
            //print("L1: \(l1!.value!), L2: \(l2!.value!), Result: \(value)")
            l1!.value = value as! T
            l1 = l1?.next
            if (l1 != nil){
                l2 = l2?.next
            }
        }
        
        //var reversedHead = reverseLinkedList(list: &l2)
        //print("Reverse value is \(reversedHead?.value)")
        //printAll(head: &reversedHead)
    
    }
    
    func mergeList(head1:inout Node<T>?,head2:inout Node<T>?) -> Node<T>?{
        var l1 = head1
        while l1?.next != nil {
            l1 = l1?.next
        }
        l1?.next = head2
        return l1
    }
    
    func printAll(head:inout Node<T>?){
        var current:Node? = head
        var valueString:String = ""
        while (current != nil) {
            valueString = add(num1: valueString, "\(current!.value!) ")
            //valueString = valueString + "\(current!.value!)"
            current = current?.next;
        }
        print("Value is \(valueString)")
    }

    
}
//2 -> 9 -> 8 -> 12 -> 7 -> 10
var linkedList = LinkedList<Int>()
var head:Node<Int>? = nil
//Head always point to the first
linkedList.push(head: &head, value: 2)
linkedList.push(head: &head, value: 9)
linkedList.push(head: &head, value: 8)
linkedList.push(head: &head, value: 12)
linkedList.push(head: &head, value: 7)
linkedList.push(head: &head, value: 10)
//linkedList.push(head: &head, value: 6)
//linkedList.printAll(head: &head)
var toReturn = linkedList.splitLinkedList(list: &head)
//linkedList.printAll(head: &toReturn)
var node = linkedList.reverseLinkedList(list: &toReturn)
linkedList.calcuateDifferenceAndMerge(head1: head, head2: node)
var originalNode = linkedList.reverseLinkedList(list: &node)
//linkedList.printAll(head: &originalNode)
linkedList.mergeList(head1: &head, head2: &originalNode)
print("Final Result is");
linkedList.printAll(head: &head)


