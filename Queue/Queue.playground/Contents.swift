//: Playground - noun: a place where people can play

import UIKit

//MARK: - Queue

struct Queue<T> {
    
    fileprivate var queue = [T]()
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public var count: Int {
        return queue.count
    }
    
    public mutating func enQueue(element: T) {
        queue.append(element)
    }
    
    public mutating func deQueue()-> T? {
        if isEmpty {
           return nil
        } else {
           return queue.removeFirst()
        }
    }
    
    public var front: T? {
        return queue.first
    }
}

var queue = Queue<String>()
queue.enQueue(element: "Андрей")
queue.enQueue(element: "Маша")
queue.enQueue(element: "Вика")
queue.front //Андрей
queue.deQueue() //Андрей
queue.front // Маша
queue.deQueue() //Маша

// dequeue O(n)
// Optimization:

struct newQueue<T> {

    fileprivate var queue = [T?]()
    var head = 0

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public var count: Int {
        return queue.count
    }

    public mutating func enQueue(element: T) {
        queue.append(element)
    }

    public mutating func deQueue()-> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1

        let percentage = Double(head) / Double(queue.count)
        if queue.count > 50 && percentage > 0.25 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }

    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return queue[head]
        }
    }
}

var optQueue = newQueue<Int>()

optQueue.enQueue(element: 5)
optQueue.enQueue(element: 10)
optQueue.enQueue(element: 139)


optQueue.deQueue() // 5
optQueue.deQueue() //10
optQueue.deQueue() //139

//dequeue O(1)













