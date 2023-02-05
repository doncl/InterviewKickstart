//
//  SelectionSortV6.swift
//  SelectionSortV6
//
//  Created by Don Clore on 2/5/23.
//


func selectionSortV6(numbers: inout [Int]) {
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
