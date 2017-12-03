//: Playground - noun: a place where people can play

import UIKit

/*
 Source: https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
 
 */

class Node<T>{
    var next: Node<T>?
    var key: Int = 0
    var isVisited:Bool = false
}

class LinkedList{
    
    var head: Node<Int>?
    var last: Node<Int>?
    
    func push(key: Int) -> Node<Int>{
        if (head == nil){
            head = newNode(key: key)
            last = head
            return head!
        }
        
        while last?.next != nil {
            last = last!.next
        }
        
        let node = newNode(key: key)
        last?.next = node
        last = node
        return last!
    }
    
    func printAll(){
        var node = head
        while node != nil {
            print("Value is \(node!.key)")
            node = node?.next
        }
    }
    
    func newNode(key: Int) -> Node<Int>{
        let node = Node<Int>()
        node.key = key
        return node
    }
    
    //For Cycle Linked List
    //Floyd’s Cycle-Finding Algorithm:
    func isLLCycle() -> Bool{
        if (head == nil){return false;}
        
        var slow = head
        var fast = head
        
        var isCycle = false
        while slow != nil && slow?.next != nil && fast?.next?.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if (slow!.key == fast!.key){
                isCycle = true
                break;
            }
        }
        return isCycle
    }
    
    //Check Visited Node
    func isNodeVisited() -> Bool{
        if (head == nil){return false}
        var node = head
        var isCycle = false
        node?.isVisited = true
        while node?.next != nil {
            node = node!.next
            if (node!.isVisited){
                isCycle = true
                break
            }
            else{
                node?.isVisited = true
            }
        }
        return isCycle
    }
    
    
    
}

 let linkedList = LinkedList()
  let node1 = linkedList.push(key: 1)
  let node2 = linkedList.push(key: 2)
  let node3 = linkedList.push(key: 3)
  let node4 = linkedList.push(key: 4)
  let node5 = linkedList.push(key: 5)
  node5.next = node5
//print("Node Values are \(node1.key), \(node2.key), \(node3.key), \(node4.key), \(node5.key) ")
//linkedList.last?.next
 //linkedList.printAll()
 print("Is Linked List Cycle: \(linkedList.isLLCycle() ? "Yes": "No")")
print("Is Linked List Cycle: \(linkedList.isNodeVisited() ? "Yes": "No")")
