//
//  InsertionSortV7.swift
//  InsertionSortV7
//
//  Created by Don Clore on 2/10/23.
//

func insertionSortV7(numbers: inout [Int]) {
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
