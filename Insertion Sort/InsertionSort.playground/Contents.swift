//: Playground - noun: a place where people can play

import UIKit

//MARK: Insertion sort

let array = [5, 1, 3, 15 ,14, 19, 228, 2, 19, 6, 66, 51]

func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] > a[y-1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    
    return a
}
insertionSort(array)

func fasterInsertionSort(_ array: [Int])-> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        
        while y > 0 && temp < a[y - 1] {
            a[y] = a[y-1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}
fasterInsertionSort(array)

func genericInsertationSort<T>(_ array: [T], _ isOrderedBefore: (T,T)-> Bool)-> [T] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        
        while y > 0 && isOrderedBefore(temp, a[y - 1]) {
            a[y] = a[y-1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

genericInsertationSort(array, >)
//[228, 66, 51, 19, 19, 15, 14, 6, 5, 3, 2, 1]
genericInsertationSort(array, <)
//[1, 2, 3, 5, 6, 14, 15, 19, 19, 51, 66, 228]

let strings = ["g", "c", "q", "s", "u", "k", "a", "r", "p", "d", "o", "f", "g", "h"]
genericInsertationSort(strings, <)
//["a", "c", "d", "f", "g", "g", "h", "k", "o", "p", "q", "r", "s", "u"]

//with object
//let objects = [ obj1, obj2, obj3, ... ]
//genericInsertationSort(objects) { $0.priority < $1.priority }

