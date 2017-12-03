//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"


//Problem 1:
//Interviewer: Hacker Earth

//Modify contents of Linked List

/*
Given a Binary Tree (Bt), convert it to a Doubly Linked List(DLL). The left and right pointers in nodes are to be used as previous and next pointers respectively in converted DLL. The order of nodes in DLL must be same as Inorder of the given Binary Tree. The first node of Inorder traversal (left most node in BT) must be head node of the DLL.
 
 */



class FNode<T:Equatable>{
    var key:T? = nil
    var leftPrev:FNode? = nil
    var rightNext:FNode? = nil
    
    init(key: T?, leftPrev: FNode?, rightNext: FNode?) {
        self.key = key
        self.leftPrev = leftPrev
        self.rightNext = rightNext
    }
    
}

class TNode<T:Equatable>{
    var key:T? = nil
    var left:TNode? = nil
    var right:TNode? = nil
}

class LNode<T:Equatable>{
    var value:T? = nil
    var prev:LNode? = nil
    var next:LNode? = nil
    
    init(value: T?, prev: LNode?, next: LNode?) {
        self.value = value
        self.prev = prev
        self.next = next
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = LNode(value: value, prev: prev, next: next)
        return copy
    }
}

class DLL<T:Equatable>{
    init() {
    }
    
    
   /* func push(head:inout LNode<T>?,value:T) -> LNode<T>?{
        //var firstNode = head
        if (head == nil){
            return newNode(value: value)
        }
        while head?.next != nil {
            head = head?.next
        }
        
        head?.next = newNode(value: value)
        head?.next?.prev = head
        head = head?.next

        return head
    }*/
    
    private func newNode(value:T) -> FNode<T>? {
        let node = FNode<T>(key: value, leftPrev: nil, rightNext: nil)
        return node
    }
    
   
    
}

class BinaryTree<T: Equatable>{
    let dll = DLL<Int>()
    var dllHead:LNode<Int>? = nil
    //static var head1 = 10
    
    init() {
        
    }
    
    func insertNode(root:FNode<T>?,key:T) -> FNode<T>?{
        if (root == nil){
            return newNode(key: key)
        }
        
        if ((root!.key! as! Int) < (key as! Int)){
            root!.rightNext = insertNode(root: root!.rightNext, key: key)
        }
        else{
            root!.leftPrev = insertNode(root: root!.leftPrev, key: key)
        }
        return root!
    }
    
    func newNode(key:T)-> FNode<T>?{
        let node = FNode<T>(key: key, leftPrev: nil, rightNext: nil)
        return node
    }
    
    
//    func inorder(root:TNode<T>?) -> LNode<Int>?{
//        if (root != nil)
//        {
//            inorder(root: root!.left);
//            //print("--------------------------")
//            print("\(String(describing: root!.key!)) \n")
//            //print("DLL Head: \(dllHead?.value)")
//            let retHead = dll.push(head: &dllHead, value: (root!.key! as! Int))
//            print("retHead value is \(String(describing: retHead!.value!)) and DLL value \(String(describing: dllHead?.value))")
//            if (dllHead == nil){
//                dllHead = retHead?.copy() as? LNode<Int>
//                //print("Inside value \(dllHead!.value!) \n")
//            }
//            //print("Pushing Value: \(retHead!.value!) and DLL value: \(dllHead?.value)")
//                        //printf("%d \n", root.key);
//            inorder(root: root!.right);
//        }
//        return dllHead
//    }
    
    func printAll(head:inout LNode<T>?){
        print("-------------------")
        while head != nil {
            print(head!.value!)
            head = head?.next
        }
    }
    
    var prev: FNode<Int>?
    var current: FNode<Int>?
    
    
    func BinaryTree2DoubleLinkedList(root: FNode<Int>?, head: inout FNode<Int>?){
        if root == nil {return}
        
//        BinaryTree2DoubleLinkedList(root: root?.leftPrev, head: &head)
//        prev = current
//        current = root
//        prev?.rightNext = current
//        current?.leftPrev = prev
        //static var head = 10
        
        //BinaryTree2DoubleLinkedList(root: root?.rightNext, head: &head)
    }
    
}


let tree = BinaryTree<Int>()
//let list = DLL<Int>()
//var lHead:LNode<Int>? = nil

//var head:TNode<Int>? = nil
//head = tree.insertNode(root: head, key: 8)
//tree.insertNode(root: head, key: 3)
//tree.insertNode(root: head, key: 1)
//tree.insertNode(root: head, key: 6)
//tree.insertNode(root: head, key: 10)
//tree.insertNode(root: head, key: 14)
//var lHead = tree.inorder(root: head)
//print("Final value is \(String(describing: lHead?.value))")
//var fNext = lHead?.next
//tree.printAll(head: &fNext)



/*
 
 
 void BinaryTree2DoubleLinkedList(node *root, node **head)
 {
 // Base case
 if (root == NULL) return;
 
 // Initialize previously visited node as NULL. This is
 // static so that the same value is accessible in all recursive
 // calls
 static node* prev = NULL;
 
 // Recursively convert left subtree
 BinaryTree2DoubleLinkedList(root->left, head);
 
 // Now convert this node
 if (prev == NULL)
 *head = root;
 else
 {
 root->left = prev;
 prev->right = root;
 }
 prev = root;
 
 // Finally convert right subtree
 BinaryTree2DoubleLinkedList(root->right, head);
 }
 */
































