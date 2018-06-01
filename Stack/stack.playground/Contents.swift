//: Playground - noun: a place where people can play

import UIKit


//Stack

public struct Stack<T> {
    var stack = [T]()
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var top: T? {
        return stack.last
    }
    
    var count: Int {
        return stack.count
    }
    
    mutating func push(element: T) {
        stack.append(element)
    }
    
    mutating func pop()-> T? {
        return stack.popLast()
    }
}

// O(1)

var stack = Stack<Int>()
stack.isEmpty
//true
stack.push(element: 13)
stack.isEmpty
//false
stack.push(element: 99)
stack.push(element: 88)
stack.top
//88

stack.pop()
stack.top
//99
