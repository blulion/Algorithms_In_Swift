//: Playground - noun: a place where people can play


//  LRU_Cache.swift
//
//
//  Created by Administrator on 1/2/18.
//

import Foundation
import UIKit

class Node<T: Equatable>{
    var value: T? = nil
    var next: Node? = nil
    var prev: Node? = nil
}

class LRU <T:Equatable>{
    var dict = Dictionary<Int,Node<Int>>()
    var head:Node<Int>? = nil
    var last:Node<Int>? = nil
    var cacheSize = 1
    init(_ size: Int) {
        self.cacheSize = size
    }
    
    func pushNode(key: Int){
        if (head == nil){
            head = createNode(key,nil,nil)
            last = head
            //print("Value : \(head!.value!)")
            dict[head!.value!] = head
            return
        }
        //print("Count : \(dict.keys.count)")
        if (dict[key] != nil){
            //Move node to front
            let node = dict[key] //contains actual node
            node?.prev?.next = node?.next
            node?.next?.prev = node?.prev
            node?.next = head
            head?.prev = node
            node?.prev = nil
            head = node
        }
        else{
            if (dict.keys.count == self.cacheSize){
                dict.removeValue(forKey: last!.value!)
                last = last?.prev
                last?.next = nil
                head = createNode(key,nil,head)
                dict[head!.value!] = head
            }
            else{
                head = createNode(key,nil,head)
                dict[head!.value!] = head
                if let next = head?.next{
                    if next.value == last!.value {
                        last!.prev = head
                    }
                }
            }
        }
    }
    
    func createNode(_ key:Int,_ prev:Node<Int>?,_ next:Node<Int>?) -> Node<Int>{
        let newNode = Node<Int>()
        newNode.value = key
        newNode.prev = prev
        newNode.next = next
        next?.prev = newNode
        return newNode
    }
    
    func printAll(){
        var node = head
        while node != nil {
            print("Value: \(node!.value!)")
            node = node?.next
        }
    }
}

var lruCache = LRU<Int>(3)
lruCache.pushNode(key: 1)
lruCache.pushNode(key: 2)
lruCache.pushNode(key: 3)
lruCache.pushNode(key: 2)
lruCache.pushNode(key: 4)
lruCache.pushNode(key: 1)
lruCache.printAll()


