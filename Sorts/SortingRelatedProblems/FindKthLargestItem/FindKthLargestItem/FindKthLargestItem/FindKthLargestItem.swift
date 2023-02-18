//
//  FindKthLargestItem.swift
//  FindKthLargestItem
//
//  Created by Don Clore on 2/17/23.
//

import Foundation

func findKthLargestItem(numbers: inout [Int], k: Int) -> Int {
  let indexToFind = numbers.count - k
  
  func helper(start: Int, end: Int) {
    guard end != start else {
      return
    }
    let randomPivotIdx = Int.random(in: start...end)
    numbers.swapAt(start, randomPivotIdx)
    
    let pivot = numbers[start]
    
    var smaller = start
    for bigger in (start + 1)...end {
      if numbers[bigger] <= pivot {
        smaller += 1
        numbers.swapAt(smaller, bigger)
      }
    }
    numbers.swapAt(start, smaller)
    
    if smaller == indexToFind {
      return
    }
        
    if indexToFind < smaller {
      helper(start: start, end: smaller - 1)
    } else {
      helper(start: smaller + 1, end: end)
    }
  }
      
  helper(start: 0, end: numbers.count - 1)
  return numbers[indexToFind]
}
