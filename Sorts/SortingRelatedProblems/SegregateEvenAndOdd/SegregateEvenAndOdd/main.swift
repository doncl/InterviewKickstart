//
//  main.swift
//  SegregateEvenAndOdd
//
//  Created by Don Clore on 2/14/23.
//

import Foundation

func segregate_evens_and_odds(numbers: [Int]) -> [Int] {
  var mutable = numbers
  var red = 0
  var green = mutable.count - 1
  
  while green >= red {
    if mutable[red].isMultiple(of: 2) {
      red += 1
    } else if !mutable[green].isMultiple(of: 2) {
      green -= 1
    } else {
      mutable.swapAt(red, green)
      red += 1
      green -= 1
    }
  }

  return mutable
}


var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 232, 433]

let result = segregate_evens_and_odds(numbers: numbers)

print(result)



