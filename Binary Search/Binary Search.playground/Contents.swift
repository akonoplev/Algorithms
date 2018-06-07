//: Playground - noun: a place where people can play

import UIKit

//MARK: - Binary Search

let nums = [23, 21, 12, 2, 5, 67, 43, 24, 19, 6, 9, 13, 29, 14854, 3241,1234, 0, 44, 99, 88 ,14]

nums.index(of: 13)

// num.index(of: ) it is line search, this work like
func lineSearch<T: Equatable>(_ array: [T],_ num: T)-> Int? {
    for i in 0 ..< array.count {
        if array[i] == num {
            return i
        }
    }
    return nil
}

func binarySearch<T: Comparable>(_ array: [T],_ key: T, range: Range<Int>)-> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
        
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if array[midIndex] > key {
            return binarySearch(array, key, range: range.lowerBound ..< midIndex)
        } else if array[midIndex] < key {
            return binarySearch(array, key, range: midIndex + 1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
}

let sortNums = nums.sorted()
binarySearch(sortNums, 13, range: 0 ..< sortNums.count)
