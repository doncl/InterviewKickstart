//
//  InsertionSortV2.swift
//  InsertionSortV2
//
//  Created by Don Clore on 2/4/23.
//

func insertionSortV2(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var red = i - 1
    let temp = numbers[i]
    while red >= 0 && numbers[red] > temp {
      numbers[red + 1] = numbers[red]
      red -= 1
    }
    numbers[red + 1] = temp
  }
}
