//
//  SelectionSortV7.swift
//  SelectionSortV7
//
//  Created by Don Clore on 2/6/23.
//

func selectionSortV7(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var smallestIndex = i
    
    for j in stride(from: numbers.count - 1, to: i, by: -1) {
      if numbers[j] < numbers[smallestIndex] {
        smallestIndex = j
      }
    }
    
    if smallestIndex != i {
      numbers.swapAt(smallestIndex, i)
    }
  }
}
