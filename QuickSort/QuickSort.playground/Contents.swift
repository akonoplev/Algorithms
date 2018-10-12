//: Playground - noun: a place where people can play

import UIKit

//MARK: - Quick Sort

var array = [-3, 5, 16, 1, -19, 0, 0, 18, 3, 1994, -109, 56, 93]

//MARK: non effective because used swift filtred three times

func quickSort<T: Comparable>(_ array: [T])-> [T] {
    let num = array[array.count / 2]

    let less = array.filter { $0 < num }
    let equel = array.filter { $0 == num }
    let more = array.filter {$0 > num }
    return quickSort(less) + equel + quickSort(more)
}

let a = quickSort(array)
print(a)


//MARK: Lomuto partitioning
func partitionLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int)-> Int {

    let pivot = array[high]
    var i = low
    for j in low..<high {
        if array[j] <= pivot {
            (array[i], array[j]) = (array[j], array[i])
            i += 1
        }
    }
    (array[i], array[high]) = (array[high], array[i])
    return i
}

//partitionLomuto(&array, low: 0, high: array.count - 1)
//print(array)
//[-3, 5, 16, 1, -19, 0, 0, 18, 3, -109, 56, 93, 1994]

func quickSortLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int ) {
    if low < high {
        let p = partitionLomuto(&array, low: low, high: high)
        partitionLomuto(&array, low: low, high: p - 1)
        partitionLomuto(&array, low: p + 1, high: high)
    }
}

quickSortLomuto(&array, low: 0, high: array.count - 1)
print(array)
