//: Playground - noun: a place where people can play

import UIKit

//target: Count how often a certain value appears in an array.

let array = [1, 2, 4 ,5, 6, 6, 6, 6, 6 ,6 , 9, 12, 43]

func countOccurrences(_ key: Int, array: [Int])-> Int {
    func leftBinary()-> Int {
        var low = 0
        var high = array.count
        while low < high {
            let midIndex = low + (high - low) / 2
            if array[midIndex] < key {
                low = midIndex + 1
            } else {
                high = midIndex
            }
        }
        return low
    }
    
    func rightBinary()-> Int {
        var low = 0
        var high = array.count
        while low < high {
            let midIndex = low + (high - low) / 2
            if array[midIndex] > key {
                high = midIndex
            } else {
                low = midIndex + 1
            }
        }
        return low
    }
    return rightBinary() - leftBinary()
}

countOccurrences(6, array: array)
