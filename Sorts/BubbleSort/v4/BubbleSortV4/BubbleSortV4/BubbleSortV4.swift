//
//  BubbleSortV4.swift
//  BubbleSortV4
//
//  Created by Don Clore on 2/5/23.
//


func bubbleSortV4(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    for j in stride(from: numbers.count - 1, to: i, by: -1) {
      if numbers[j] < numbers[j - 1] {
        numbers.swapAt(j, j-1)
      }
    }
  }
}
