//
//  InsertionSortV5.swift
//  InsertionSortV5
//
//  Created by Don Clore on 2/9/23.
//

func insertionSort(numbers: inout [Int]) {
  

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
