//: Playground - noun: a place where people can play

import UIKit


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



struct SpecialStack{
    private var array:[Int] = [];
    private var minElement:Int = -1;
    
    mutating func push(_ e: Int){
        if (array.count == 0){
            minElement = e
            array.append(e)
        }
        else if (e <= minElement){
            array.append(2*e-minElement)
            minElement = e
        }
        else{
           array.append(e)
        }
    }
    
    mutating func pop() -> Int?{
        if let last = array.last{
            if (last < minElement){
                minElement = 2*minElement - last
            }
        }
        return array.popLast()
    }
    
    func peek() -> Int?{
        return array.last
    }
    
    
    func getMinElement() -> Int?{
        return array.isEmpty ? -1 : minElement
    }
}

extension SpecialStack: CustomStringConvertible {
    
    var description: String {
        if array.count == 0 {
            return "Stack is empty"
        }
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

var stack = SpecialStack()
stack.push(18)
stack.push(19)
stack.push(29)
stack.push(15)
stack.push(16)

print(stack.description);
print("Min: \(stack.getMinElement()!)")

stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.pop()
print(stack.description);
print("Min: \(stack.getMinElement()!)")



