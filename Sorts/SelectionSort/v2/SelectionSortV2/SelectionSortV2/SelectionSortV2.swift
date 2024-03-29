//
//  SelectionSortV2.swift
//  SelectionSortV2
//
//  Created by Don Clore on 1/29/23.
//

public func selectionSortV2(numbers: inout [Int]) {
   
    for i in 0..<numbers.count {
        var smallestIndex = i
        
        for j in (i + 1)..<numbers.count {
            let candidate = numbers[j]
            
            if candidate < numbers[smallestIndex] {
                smallestIndex = j
            }
        }

        if smallestIndex != i {
            numbers.swapAt(i, smallestIndex)
        }
    }
}
