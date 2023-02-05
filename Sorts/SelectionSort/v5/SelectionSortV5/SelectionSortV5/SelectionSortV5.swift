//
//  SelectionSortV5.swift
//  SelectionSortV5
//
//  Created by Don Clore on 2/4/23.
//

func selectionSortV5(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var smallestIndex = i
    for j in (i + 1)..<numbers.count {
      if numbers[j] < numbers[smallestIndex] {
        smallestIndex = j
      }
    }
    
    if smallestIndex != i {
      numbers.swapAt(smallestIndex, i)
    }
  }
}
