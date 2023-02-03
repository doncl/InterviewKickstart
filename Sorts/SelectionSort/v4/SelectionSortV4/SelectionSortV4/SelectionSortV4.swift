//
//  SelectionSortV4.swift
//  SelectionSortV4
//
//  Created by Don Clore on 2/3/23.
//

func selectionSortV4(numbers: inout [Int]) {
    for i in 0..<numbers.count {
        var smallestIndex = i
        
        for j in (i + 1)..<numbers.count {
            if numbers[j] < numbers[smallestIndex] {
                smallestIndex = j
            }
        }
        
        if smallestIndex != i {
            numbers.swapAt(i, smallestIndex)
        }
    }
}
