//
//  SelectionSort.swift
//  SelectionSort
//
//  Created by Don Clore on 1/29/23.
//

//class SelectionSort {
//
//}

public func selectionSort(numbers: inout [Int]) {
    var smallest = Int.max
    for i in 0..<numbers.count {
        var smallestIndex = i
        var smallest = numbers[i]
        for j in (i + 1)..<numbers.count {
            let candidate = numbers[j]
            if candidate < smallest {
                smallest = candidate
                smallestIndex = j
            }
        }
        
        if smallestIndex != -1, smallestIndex != i {
            let temp = numbers[i]
            numbers[i] = smallest
            numbers[smallestIndex] = temp
        }
    }
}
