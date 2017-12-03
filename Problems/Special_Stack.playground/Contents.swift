//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"


//Problem 1:
//Interviewer: Amazon

/* Design a data-structure SpecialStack (using the STL of stack) that supports all the stack operations like push(), pop(), isEmpty(), isFull() and an additional operation getMin() which should return minimum element from the SpecialStack. Your task is to complete all the functions, using stack data-Structure.
 
 Input:
 The first line of input contains an integer denoting the no of test cases. Then T test cases follow. Each test case contains two lines. The first line of input contains an integer n denoting the number of integers in a sequence. In the second line are n space separated integers of the stack.
 
 Output:
 Single line output. Print the minimum integer from the stack in respective line.
 
 Constraints:
 1<=T<=100
 1<=N<=100
 
 Example:
 Input:
 1
 5
 18 19 29 15 16
 Output:
 15

 */


class Node<T: Equatable>{
    var value: T? = nil
    var next: Node? = nil
    
    init(value:T?,next:Node?) {
        self.value = value
        self.next = next
    }
    
    func copy(with zone: NSZone? = nil) -> Node? {
        let copy = Node(value: value, next: next)
        return copy
    }
    
    
    public static func ==(lhs: Node, rhs: Node) -> Bool{
        if (lhs.value == rhs.value && lhs.next != nil && rhs.next != nil){
            return  lhs.value == rhs.value && lhs.next! == rhs.next!
        }
        else {
            return lhs.value == rhs.value
        }
    }
    
    
    
}

class LinkedList<T: Equatable>{
    var head:Node<T>? = nil
    var minHead:Node<T>? = nil
    var minLast:Node<T>? = nil
    var last:Node<T>? = nil
    
    init() {
        
    }
    
    func push(value:T){
        let newNode = Node<T>(value: value, next: nil)
        
        if (head == nil){
            head = newNode
            last = head
            
            //minHead = newNode
            minLast = newNode.copy()
           // print("Last: \(Unmanaged<AnyObject>.passUnretained(last! as AnyObject).toOpaque()) and Min Last: \(Unmanaged<AnyObject>.passUnretained(minLast!.copy() as AnyObject).toOpaque())")
            
            // print("Last Value is \(last!.value!)")
            return
        }
        
        /*while last?.next != nil {
            if (last!.next!.value < minLast!.value){
                
            }
            
            last = last?.next
            
        }*/
        
        
        last?.next = newNode
        last = last?.next
        //print("Last Value is \(last!.value!)")
        
        //print("1: \(self.printAll())")
        if ((last!.value as! Int) < (minLast!.value as! Int)){
            let minNewNode = newNode.copy()!
            if (minNewNode == newNode){
               // print("Yes. It's Equal")
               // print("Last: \(Unmanaged<AnyObject>.passUnretained(minNewNode as AnyObject).toOpaque()) and Min Last: \(Unmanaged<AnyObject>.passUnretained(newNode.copy() as AnyObject).toOpaque())")
            }
            minLast?.next = minNewNode
           // print("Min last value is  \(minLast!.value!) and Last Value is \(last!.value!)")

            minLast = minLast?.next
           // print("Min last value is  **** \(minLast!.value!)")
        }
        
        //print("2: \(self.printAll())")
    }
    
    
    func getMinValue() -> Int{
        if minLast != nil {
            return (minLast!.value as! Int)
        }
        return -1
    }
    
    func printAll(){
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


linkedList.push(value: 3)
linkedList.push(value: 5)
linkedList.push(value: 2)
linkedList.push(value: 4)
linkedList.push(value: 1)
//linkedList.push(value: 16)
//linkedList.push(value: 17)

//linkedList.push(value: 4)
//linkedList.push(value: 5)
//linkedList.push(value: 6)
//linkedList.push(value: 7)
//linkedList.push(value: 8)
//linkedList.push(value: 1)
//linkedList.push(value: 2)
//linkedList.push(value: 3)
//linkedList.push(value: 9)
//linkedList.push(value: 10)
//linkedList.push(value: 18)
//linkedList.push(value: 19)
//linkedList.push(value: 20)



//linkedList.push(value: 6)
linkedList.printAll()
print("Min Value \(linkedList.getMinValue())")

//var toReturn = linkedList.splitLinkedList(list: &head)
//linkedList.printAll(head: &toReturn)
//var node = linkedList.reverseLinkedList(list: &toReturn)



