//
//  ThreeSumSmaller.swift
//  ThreeSumSmaller
//
//  Created by Don Clore on 2/20/23.
//



func count_triplets(target: Int, numbers: [Int]) -> Int {
  let arr = numbers.sorted()
  
  var count = 0
  
  for i in 0..<arr.count {
    var left = i + 1
    var right = arr.count - 1
    
    while left < right {
      let sum = arr[i] + arr[left] + arr[right]
      if sum < target {
        count += right - left
        left += 1
      } else {
        right -= 1
      }
    }
  }
    
  return count
}
