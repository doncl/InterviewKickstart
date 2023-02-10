//
//  RadixSortV2.swift
//  RadixSortV2
//
//  Created by Don Clore on 2/10/23.
//

import Foundation

func radixSort(numbers: inout [Int]) {
  let base = 10
  var done = false

  
  func populatePosMap(forNthDigitPlace digits: Int) {
    done = true
    var posMap: [[Int]] = Array(repeating: [], count: base)
    var negMap: [[Int]] = Array(repeating: [], count: base)
    
    for i in 0..<numbers.count {
      let number = numbers[i]
      let remainder = number  / digits
      if remainder > 0 {
        done = false
      }
      let digit = remainder % base
      
      if digit >= 0 {
        assert(posMap.count > digit)
        posMap[digit].append(number)
      } else {
        let absDigit = abs(digit)
        assert(negMap.count > absDigit)
        negMap[absDigit].append(number)
      }
    }
    numbers = negMap.flatMap { $0 }
    numbers.append(contentsOf: posMap.flatMap { $0 })
  }

  var digitsPlace = 1
  while !done {
    populatePosMap(forNthDigitPlace: digitsPlace)
    digitsPlace *= base
  }
    
  print(numbers)
}

