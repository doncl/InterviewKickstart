//
//  InsertionSortV1.swift
//  InsertionSortV1
//
//  Created by Don Clore on 2/4/23.
//

func insertionSortV1(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    let temp = numbers[i]
    var index = i - 1
    while index >= 0 && numbers[index] > temp {
      numbers[index + 1] = numbers[index]
      index -= 1
    }
    numbers[index + 1] = temp
  }
}
