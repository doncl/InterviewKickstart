//
//  RadixSortV1.swift
//  RadixSortV1
//
//  Created by Don Clore on 2/10/23.
//

// N.B. - this sort does not handle negative numbers at all.
func radixSort(numbers: inout [Int]) {
  let base = 10  
  var done = false
  var digits = 1
  
  while !done {
    done = true
    var buckets: [[Int]] = Array(repeating: [], count: base)
    
    numbers.forEach { number in
      let remainingPart = number / digits
      let digit = remainingPart % base
      buckets[digit].append(number)
      if remainingPart > 0 {
        done = false
      }
    }
    
    digits *= base
    numbers = buckets.flatMap { $0 }
  }
}
