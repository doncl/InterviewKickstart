//
//  QuickSortHoareV1.swift
//  QuickSortHoareV1
//
//  Created by Don Clore on 2/7/23.
//

func quickSort(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    let pivot = Int.random(in: start...end)
    numbers.swapAt(pivot, start)
    
    // Hoare
    var red = start + 1
    var green = end
    
    while green >= red {
      if numbers[red] < numbers[start] {
        red += 1
      } else if numbers[green] > numbers[start] {
        green -= 1
      } else {
        numbers.swapAt(red, green)
        red += 1
        green -= 1
      }
    }
    numbers.swapAt(start, green)
    
    helper(start: start, end: green - 1)
    helper(start: green + 1, end: end)
  }
  
  helper(start: 0, end: numbers.count - 1)
}
