//
//  InsertionAndLomutoV5.swift
//  InsertionAndLomutoV5
//
//  Created by Don Clore on 2/11/23.
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


func quickSortLomuto(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    let randomPivotIdx = Int.random(in: start...end)
    numbers.swapAt(start, randomPivotIdx)
    
    var smaller = start
    for bigger in (smaller + 1)...end {
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

