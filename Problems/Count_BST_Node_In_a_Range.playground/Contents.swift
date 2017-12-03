//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
/*
 Given a Binary Search Tree (BST) and a range, count the number of nodes in the BST that lie in the given range. You are required to complete the function getCountOfNode. You should not read any input from stdin/console. There are multiple test cases. For each test case, this method will be called individually.
 
 
 Input (only to be used for Expected Output):
 The first line of the input contains an integer 'T' denoting the nummber of test cases. Then 'T' test cases follow. Each test case consists of three lines. Description of  test cases is as follows:
 The First line of each test case contains an integer 'N' which denotes the no of nodes in the BST.   .
 The Second line of each test case contains 'N' space separated values of the nodes in the BST.
 The Third line of each test case contains two space separated integers 'l' and 'h' denoting the range, where l < h
 
 Output:
 You are required to complete the function getCountOfNode which takes three arguments. The first being the root of the tree, and then two integers l and h, denoting the range. The function returns an integer denoting the no of nodes in the given range.
 
 Constraints:
 1 <= T <= 50
 1 <= N <= 50
 1 <= l < h < 1000
 
 Example:
 Input
 1
 6
 10 5 50 1 40 100
 5 45
 
 Output
 3

 */

class Node<T:Equatable>{
    var key:T?
    var left:Node<T>?
    var right:Node<T>?
}


class BSTree<T:Equatable>{
    
    private var root:Node<T>?
    
    func BSTInsert(root:inout Node<T>?,node:Node<T>) -> Node<T>{
        if (root == nil){
            return node
        }
        if ((root!.key! as! Int) < (node.key as! Int)){
            var newRight = root?.right
            root!.right = BSTInsert(root: &newRight, node: node)
            
        }
        else{
            var newLeft = root?.left
            root!.left = BSTInsert(root: &newLeft, node: node)
        }
        return root!
        
    }
    
    private func createNode(key:T) -> Node<T>{
        let node = Node<T>()
        node.key = key
        return node
    }
    
    func insertNode(key:T) -> Node<T>?{
        //var rootNode = root
        let newNode = self.createNode(key: key)
        self.root = self.BSTInsert(root: &self.root, node: newNode)
        return self.root
    }
    
    /*
 
     if(root==null)
     return 0;
     if(root.data>=low && root.data<=high)
     return 1+getCountOfNode(root.left,low,high)+getCountOfNode(root.right,low,high);
     else
     return getCountOfNode(root.left,low,high)+getCountOfNode(root.right,low,high);
    */
    
    
    func getCountOfNode(node:Node<T>?,l:Int,h:Int) -> Int {
        if (node == nil){
            return 0;
        }
        //print("Node Key is \(String(describing: node!.key))")
        if ((node?.key as! Int) >= l && (node?.key as! Int) <= h){
            let count = 1 + getCountOfNode(node: node?.left,l:l,h:h) + getCountOfNode(node: node?.right,l:l,h:h);
            //print("Count A: \(count)")
            return count
        }
        else{
            let count =  getCountOfNode(node: node?.left,l:l,h:h) + getCountOfNode(node: node?.right,l:l,h:h);
            //print("Count B: \(count)")
            return count
        }
    }
    
}

let bstTree = BSTree<Int>()
bstTree.insertNode(key: 10)
bstTree.insertNode(key: 5)
bstTree.insertNode(key: 50)
bstTree.insertNode(key: 1)
bstTree.insertNode(key: 40)
let root = bstTree.insertNode(key: 100)
//print("Root Key is \(String(describing: root?.key))")

print("Count is \(bstTree.getCountOfNode(node: root, l: 10, h: 100))")






