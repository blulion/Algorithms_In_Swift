//: Playground - noun: a place where people can play

import UIKit

/*
 Serialization is to store tree in a file so that it can be later restored. The structure of tree must be maintained. Deserialization is reading tree back from file.
 */

class Node<T>{
    var key: Int!
    var left: Node<Int>?
    var right:Node<Int>?
}

class BinarySearchTree{
    
    //var root: Node<Int>?
    var array = [Int]()
    
    func insert(_ key: Int, _ root: Node<Int>?) -> Node<Int>{
        var nroot = root
        if (nroot == nil){
            nroot = newNode(key: key)
            return nroot!
        }
        if (key < nroot!.key){
            nroot?.left = insert( key, nroot?.left)
        }
        else{
            nroot?.right = insert(key, nroot?.right)
        }
        return nroot!
    }
    
    
    func newNode(key: Int) -> Node<Int>{
        let node = Node<Int>()
        node.key = key
        return node
    }
    
    //Write to an array
    func serialize(_ node: Node<Int>?) -> Array<Int>{
        if (node == nil){
            return array
        }
        array.append(node!.key)
        serialize(node?.left)
        serialize(node?.right)
        return array
    }
    
    func findPartitionIndex(arr: Array<Int>, low:Int, high: Int){
        
    }
    
    
    func deserialize(arr:Array<Int>, low: Int, high: Int) -> Node<Int>?{
        if (low > high){return nil;}
        var node = newNode(key:arr[low])
        var index = findPartitionIndex(arr,low,high)
        
    }
    
//    func deserialize(_ nod: Node<Int>?){}
    
    func preorder(node: Node<Int>?){
        if (node == nil){
            return;
        }
        print("Key: \(node!.key)")
        preorder(node: node?.left)
        preorder(node: node?.right)
        
    }
}

var tree = BinarySearchTree()
var root:Node<Int>? = nil
root = tree.insert(20,root)
tree.insert(8,root)
tree.insert(4,root)
tree.insert(12,root)
tree.insert(10,root)
tree.insert(14,root)
tree.insert(22,root)

tree.preorder(node: root)
print("Serialized value: \(tree.serialize(root))")



