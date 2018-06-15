//: Playground - noun: a place where people can play

import UIKit

//MARK: - BitSet


struct BitSet {
    private(set) public var size: Int
    private let N = 64
    typealias Word = UInt64
    private(set) public var words: [Word]
    
    private let allOnes = ~Word()
    
    public init(size: Int) {
        precondition(size > 0)
        // precondition check a necessary condition for marking forward progress
        self.size = size
        
        let n = (size + (N - 1)) / N
        words = [Word](repeating: 0, count: n)
    }
    
    func indexOf(_ i: Int)-> (Int, Word) {
        precondition(i >= 0)
        precondition(i < size)
        let o = i / N
        let m = Word(i - o*N)
        return (o, 1 << m)
    }
    
    mutating func set(_ i: Int) {
        let (j, m) = indexOf(i)
        words[j] |= m
    }
    
    mutating func clear(_ i: Int) {
        let (j, m) = indexOf(i)
        words[j] &= ~m
    }
    
    func isSet(_ i: Int)-> Bool {
        let (j,m) = indexOf(i)
        return (words[j] & m) != 0
    }
    
    subscript(i: Int) -> Bool {
        get { return isSet(i)  }
        set { if newValue { set(i) } else { clear(i) } }
    }
    
    mutating func flip(_ i: Int)-> Bool {
        let (j,m) = indexOf(i)
        words[j] ^= m
        return (words[j] & m) != 0
    }
    
    mutating func clearAll() {
        for i in 0..<words.count {
            words[i] = 0
        }
    }
    
    mutating func setAll() {
        for i in 0..<words.count {
            words[i] = allOnes
        }
    }
}

var bitSet = BitSet(size: 190)

print(bitSet.indexOf(2))
//(0,4)
print(bitSet.indexOf(176))
//(2, 281474976710656)

var bits = BitSet(size: 140)
bits[2] = true
bits[14] = true
bits[130] = true
print(bits.words[2])



