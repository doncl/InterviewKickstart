//
//  QuickSortV3.swift
//  QuickSortV3
//
//  Created by Don Clore on 2/7/23.
//

func quickSortV3(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    let randomPivot = Int.random(in: start...end)
    numbers.swapAt(randomPivot, start)
    
    var smaller = start
    
    for bigger in (start + 1)...end {
      if numbers[bigger] < numbers[start] {
        smaller += 1
        numbers.swapAt(bigger, smaller)
      }
    }
    numbers.swapAt(start, smaller)
    
    helper(start: start, end: smaller - 1)
    helper(start: smaller + 1, end: end)
  }
  
  helper(start: 0, end: numbers.count - 1)
}
