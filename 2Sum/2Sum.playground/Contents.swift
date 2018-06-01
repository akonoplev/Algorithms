//: Playground - noun: a place where people can play

import UIKit

//MARK: - two sum
// input parameters
    let array = [1, 32, 2 ,3, 4, 8, 11, 23]
    let target = 13
// this solutions work only for first couple

// first solution
func twoSum(_ nums: [Int], target: Int) -> (Int, Int)? {
    var dict = [Int: Int]()

    for (index, n) in nums.enumerated() {
        let complement = target - n
            //find two part sum
        if let complementIndex = dict[complement] {
            return (complementIndex, index)
        }
        dict[n] = index
    }

    return nil
}
let solution1 = twoSum(array, target: target)
print(solution1 ?? "Решения нету")

// second solution
func twoSum2(integers: [Int], target: Int)-> (Int, Int)? {
    var i = 0
    var j = integers.count - 1
    
    while i < j {
        let sum = integers[i] + integers[j]
        if sum == target {
            return (i, j)
        } else if sum < target {
            i += 1
        } else {
            j -= 1
        }
    }
    
    return nil
}

let solution2 = twoSum(array, target: target)
print(solution2 ?? "Решения нету")






