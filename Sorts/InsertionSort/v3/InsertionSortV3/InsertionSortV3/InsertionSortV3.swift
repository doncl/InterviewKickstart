//
//  InsertionSortV3.swift
//  InsertionSortV3
//
//  Created by Don Clore on 2/5/23.
//

func insertionSortV3(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    let temp = numbers[i]
    var red = i - 1
    
    while red >= 0 && numbers[red] > temp {
      numbers[red + 1] = numbers[red]
      red -= 1
    }
    
    numbers[red + 1] = temp 
  }
}
