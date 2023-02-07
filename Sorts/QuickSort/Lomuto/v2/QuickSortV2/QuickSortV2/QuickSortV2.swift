//
//  QuickSortV2.swift
//  QuickSortV2
//
//  Created by Don Clore on 2/7/23.
//


// Create pivot index using random number generator
func quickSortV2(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
//    let pivotIndex = Int.random(in: start...end)
//    numbers.swapAt(start, pivotIndex)
    
    // Lomuto's partitioning
    var smaller = start
    
    for bigger in (start + 1)...end {
      if numbers[bigger] < numbers[start] {
        smaller += 1
        numbers.swapAt(smaller, bigger)
      }
    }
    numbers.swapAt(start, smaller)
    
    helper(start: start, end: smaller - 1)
    helper(start: smaller + 1, end: end)
  }
  
//  helper(start: 0, end: numbers.count - 1)
}


func quickSortV1(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    let pivotIndex = Int.random(in: start...end)
    numbers.swapAt(start, pivotIndex)
    
    // Lomuto's partitioning
    var smaller = start
    for i in (start + 1)...end {
      if numbers[i] < numbers[start] {
        smaller += 1
        numbers.swapAt(smaller, i)
      }
    }
    numbers.swapAt(start, smaller)
    
    helper(start: start, end: smaller - 1)
    helper(start: smaller + 1, end: end)
  }
  
  
  helper(start: 0, end: numbers.count - 1)
}












