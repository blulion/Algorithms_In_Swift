//: Playground - noun: a place where people can play

import UIKit

class Node<T:Equatable>{
    var key:T?
    var left:Node<T>?
    var right:Node<T>?
}

class BinaryTree<T:Equatable>{
    //15,6,18,3,7,17
    func insertNode(root:Node<T>?,key:T) -> Node<T>?{
        if (root == nil){
            return newNode(key: key)
        }
        
        if ((root!.key! as! Int) < (key as! Int)){
            root!.right = insertNode(root: root!.right, key: key)
        }
        else{
            root!.left = insertNode(root: root!.left, key: key)
        }
        return root!
    }
    
    
    func newNode(key:T)-> Node<T>?{
        let node = Node<T>()
        node.key = key
        node.left = nil
        node.right = nil
        return node
    }
    
    
    func mirror(root: Node<T>?) -> Node<T>?{
        var temp:Node<T>? = nil
        
        if (root == nil){
            return nil;
        }
        mirror(root: root?.left);
        mirror(root: root?.right);
        
        temp = root?.left
        root?.left = root?.right
        root?.right = temp;
        
        return root

    }
    
    func inorder(root:Node<T>?){
        if (root != nil)
        {
            inorder(root: root!.left);
            print("\(String(describing: root!.key!)) \n")
            //printf("%d \n", root.key);
            inorder(root: root!.right);
        }
    }
   
}

let bt = BinaryTree<Int>()
var head:Node<Int>? = nil
head = bt.insertNode(root: head, key: 30);
head = bt.insertNode(root: head, key: 20);
head = bt.insertNode(root: head, key: 10);
head = bt.insertNode(root: head, key: 50);
head = bt.insertNode(root: head, key: 40);
head = bt.insertNode(root: head, key: 70);
bt.inorder(root: head);

print("----- Mirror Head ------");
head = bt.mirror(root: head);

bt.inorder(root: head);










