//: Playground - noun: a place where people can play

import UIKit

//Binary tree

indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
}

/// equation - (18 * (a + 13)) + (-189 / (b + 1))

let node18 = BinaryTree.node(.empty , "18", .empty)
let nodeA = BinaryTree.node(.empty , "a" , .empty)
let node13 = BinaryTree.node(.empty, "13", .empty)
let node189 = BinaryTree.node(.empty , "189", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)
let node1 = BinaryTree.node(.empty, "1" , .empty)

//intermeduate nodes on the left
let aMinus = BinaryTree.node(nodeA, "-", node13)
let aMinusMultiplicate = BinaryTree.node(node18, "*", aMinus)

// intermediate nodes on the right

let minusNode189 = BinaryTree.node(.empty, "-", node189)
let sum = BinaryTree.node( nodeB, "+", node1)
let minusNode189AddSum = BinaryTree.node( minusNode189, "/" , sum)

let tree = BinaryTree.node(aMinusMultiplicate, "+", minusNode189AddSum)

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description) , right = [\(right.description)]]"
        case .empty:
            return ""
        }
    }
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    public func traverseInOrider(process: (T)-> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrider(process: process)
            process(value)
            right.traverseInOrider(process: process)
        }
    }
    
    public func traversePreOrder(process: (T)-> Void) {
        if case let . node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T)-> Void) {
        if case let . node(left, value, right) = self {
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
            process(value)
        }
    }
}

print(tree)

//value: +, left = [value: *, left = [value: 18, left = [ , right = []] , right = [value: -, left = [value: a, left = [ , right = []] , right = [value: 13, left = [ , right = []]]]]] , right = [value: /, left = [value: -, left = [ , right = [value: 189, left = [ , right = []]]] , right = [value: +, left = [value: b, left = [ , right = []] , right = [value: 1, left = [ , right = []]]]]]]]

print(tree.count)
//12

tree.traversePostOrder { s in
    print(s)
}

//*
//18
//-
//a
//13
///
//-
//189
//+
//b
//1
//+

