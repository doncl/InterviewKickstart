//
//  QuickSortV5Hoare.swift
//  QuickSortV5Hoare
//
//  Created by Don Clore on 2/7/23.
//

func quickSortV5Hoare(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else  {
      return
    }
    
    let pivotIndex = Int.random(in: start...end)
    numbers.swapAt(pivotIndex, start)
    let pivot = numbers[start]
    
    var smaller = start + 1
    var bigger = end

    while smaller <= bigger {
      if numbers[smaller] <= pivot {
        smaller += 1
      } else if numbers[bigger] > pivot {
        bigger -= 1
      } else {
        numbers.swapAt(smaller, bigger)
        smaller += 1
        bigger -= 1
      }
    }
    
    numbers.swapAt(start, bigger)
    
    helper(start: start, end: bigger - 1)
    helper(start: bigger + 1, end: end)
  }
  
  
  helper(start: 0, end: numbers.count - 1)
}
