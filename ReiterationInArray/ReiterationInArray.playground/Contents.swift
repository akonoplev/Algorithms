import UIKit

var str = "Hello, playground"

let sourceArray = [1, 10, 9, 8, 3, 4, 2, 7, 5, 3, 6, 11]

//first
func getReitarationItem(array: [Int]) {
    var dict = [Int: Int]()
    
    for int in array {
        var i = 0
        
        if dict[int] == nil {
            dict[int] = i
            i += 1
        } else {
            print("reiteration is \(int)")
            return
        }
    }
    print("reiteration upset")
}

getReitarationItem(array: sourceArray)

//second

func getReitarationItem2(array: [Int]) {
    var rSum = 0
    var sum = 0
    
    for int in 1...array.count - 1 {
        rSum += int
    }
    
    for int in array {
        sum += int
    }
    
    print(sum - rSum)
}
getReitarationItem2(array: sourceArray)


