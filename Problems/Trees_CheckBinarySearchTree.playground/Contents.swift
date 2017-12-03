//: Playground - noun: a place where people can play

import UIKit

/*
 Source: https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
 Soultion: https://www.youtube.com/watch?v=MILxfAbIhrE
 Problem Statement:
 For the purposes of this challenge, we define a binary search tree to be a binary tree with the following ordering properties:
 
 The  value of every node in a node's left subtree is less than the data value of that node.
 The  value of every node in a node's right subtree is greater than the data value of that node.
 Given the root node of a binary tree, can you determine if it's also a binary search tree?
 
 Complete the function in your editor below, which has  parameter: a pointer to the root of a binary tree. It must return a boolean denoting whether or not the binary tree is a binary search tree. You may have to write one or more helper functions to complete this challenge.
 
 Note: We do not consider a binary tree to be a binary search tree if it contains duplicate values.
 
 Input Format
 
 You are not responsible for reading any input from stdin. Hidden code stubs will assemble a binary tree and pass its root node to your function as an argument.
 
 Constraints
 
 Output Format
 
 You are not responsible for printing any output to stdout. Your function must return true if the tree is a binary search tree; otherwise, it must return false. Hidden code stubs will print this result as a Yes or No answer on a new line.
 
 */

class Node<T>{
    var left: Node<T>?
    var right: Node<T>?
    var key: Int = 0
}


class Stack{
    private var items = []
    
    func push(value: Int){
        items.append(value)
    }
    
    func pop() -> Int{
        if (items.count == 0){
            print("Stack is underflow")
            return -1
        }
        return items.popLast()
    }
    
    func peek() -> Int{
        if (items.count == 0){
            print("Stack is underflow")
            return -1
        }
        return items[items.count-1]
    }
    
    
    
}

class BST{

    func insertBSTNode(_ node: Node<Int>?, _ key: Int) -> Node<Int>?{
        if (node == nil){
            return newNode(key)
        }
        
        if (key < node!.key){
            node?.left = insertBSTNode(node?.left, key)
        }
        else{
            node?.right = insertBSTNode( node?.right, key)
        }
        return node!
    }

    func newNode(_ key: Int) -> Node<Int>{
        let node = Node<Int>()
        node.key = key
        return node
    }


    func inorder(node: Node<Int>?){
        if (node == nil){
            return
        }
        inorder(node: node?.left)
        print(node!.key)
        inorder(node: node?.right)
    }
    
    func inorderWithoutRecursion(node: Node<Int>?){
        var stack = Stack()
        
        while node != nil {
            stack.push(value: node!.key)
            node = node?.left
        }
        
        
    }
    
    
}





func checkBST(node: inout Node<Int>?) -> Bool{
    
//    var findDuplicateDict = [Int: Int]()
//
//    while node != nil {
//        node = node?.left
//    }
    
    
    return isBST(node: node, min: Int(INT8_MIN), max: Int(INT8_MAX))
}

func isBST(node: Node<Int>?, min: Int, max: Int) -> Bool{
    if (node == nil){
        return true
    }
    
    
    if (node!.key < min || node!.key > max){
        return false
    }
    
    return isBST(node: node?.left, min: min, max: node!.key) && isBST(node: node?.right, min: node!.key, max: max)
}
 
let tree = BST()
var root: Node<Int>?
root = tree.insertBSTNode(root, 4)
tree.insertBSTNode(root, 2)
tree.insertBSTNode(root, 1)
tree.insertBSTNode(root, 5)
tree.insertBSTNode(root, 3)
tree.insertBSTNode(root, 6)
tree.insertBSTNode(root, 8)
tree.insertBSTNode(root, 7)

tree.inorder(node: root)
print(isBST(node: root, min: Int(INT8_MIN), max: Int(INT8_MAX)))

//Non BST
var nonRoot: Node<Int> = tree.newNode(10)
nonRoot.left = tree.newNode(10)
nonRoot.right = tree.newNode(19)

nonRoot.left?.left = tree.newNode(-5)
nonRoot.right?.left = tree.newNode(17)
nonRoot.right?.right = tree.newNode(21)

findDuplicateDict[10] = 0
findDuplicateDict[19] = 0
findDuplicateDict[-5] = 0
findDuplicateDict[17] = 0
findDuplicateDict[21] = 0
//findDuplicateDict[6] = 0

//10,10,-5,19,17,21

print(isBST(node: nonRoot, min: Int(INT8_MIN), max: Int(INT8_MAX)))

/*
 
 //The Node struct is defined as follows:
 struct Node {
 int key;
 Node* left;
 Node* right;
 };
 
 bool checkBST(Node* root,int min,int max) {
 if (root == nil)return true;
 
 if (root->key < min || root->key > max)return false;
 
 return checkBST(root->left,min,root.data) && checkBST(root->right,root.data,max);
 }
 */
