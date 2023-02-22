//
//  SegregateEvenAndOddV2.swift
//  SegregateEvenAndOddV2
//
//  Created by Don Clore on 2/21/23.
//


func segregate_evens_and_odds(numbers: [Int]) -> [Int] {
  guard !numbers.isEmpty else {
    return []
  }
  
  var numbers = numbers
  var even: Int = 0
  
  for i in 0..<numbers.count {
    if numbers[i].isMultiple(of: 2) {
      numbers.swapAt(i, even)
      even += 1
    }
  }
  
  return numbers
}
