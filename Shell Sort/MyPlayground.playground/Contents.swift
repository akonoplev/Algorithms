//: Playground - noun: a place where people can play

import UIKit

//MARK: Shell sort

var array = [13, 6, 50, -18, 5, 110, -3, 0, 188, 43, 99, -1, 14]

// stride in swift

//for num in stride(from: 5, to: 0, by: -0.5) {
//    print(num)
//}
//5.0
//4.5
//4.0
//3.5
//3.0
//2.5
//2.0
//1.5
//1.0
//0.5


func insertionsSort(_ array: inout [Int], start: Int, gap: Int) {
    for i in stride(from: (start + gap), to: array.count, by: gap) {
        let currentValue = array[i]
        var pos = i
        while pos >= gap && array[pos - gap] > currentValue {
            array[pos] = array[pos - gap]
            print("a")
            pos -= gap
        }
        array[pos] = currentValue
    }
}

//insertionsSort(&array, start: 0, gap: 1)
//print(array)
//[-18, -3, -1, 0, 5, 6, 13, 14, 43, 50, 99, 110, 188]

func shellSort(_ array: inout [Int]) {
    var sublistCount = array.count / 2
    while sublistCount > 0 {
        for pos in 0..<sublistCount {
            insertionsSort(&array, start: pos, gap: sublistCount)
        }
        sublistCount = sublistCount / 2
    }
}

shellSort(&array)
print(array)
//[-18, -3, -1, 0, 5, 6, 13, 14, 43, 50, 99, 110, 188]
