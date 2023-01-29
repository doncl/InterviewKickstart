//
//  SelectionSortV2.swift
//  SelectionSortV2
//
//  Created by Don Clore on 1/29/23.
//

public func selectionSortV2(numbers: inout [Int]) {
    var smallest = Int.max
    var smallestIndex = 0
    
    for i in 0..<numbers.count {
        smallestIndex = i
        smallest = numbers[i]
        
        for j in (i + 1)..<numbers.count {
            let candidate = numbers[j]
            
            if candidate < smallest {
                smallestIndex = j
                smallest = candidate
            }
        }

        if smallestIndex != i {
            numbers.swapAt(i, smallestIndex)
        }
    }
}
