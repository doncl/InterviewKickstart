//
//  NChooseKCombinationsV3.swift
//  NChooseKCombinationsV3
//
//  Created by Don Clore on 3/6/23.
//


func find_combinations(n: Int, k: Int) -> [[Int]] {
  var ret: [[Int]] = []
  var array: [Int] = []
  for i in 1...n {
    array.append(i)
  }
  
  func helper(slate: inout [Int], index: Int, kVal: Int) {
    guard kVal > 0 else {
      ret.append(slate)
      return
    }
    for i in index..<array.count {
      slate.append(array[i])
      helper(slate: &slate, index: i + 1, kVal: kVal - 1)
      _ = slate.popLast()
    }
  }
  var slate: [Int] = []
  
  helper(slate: &slate, index: 0, kVal: k)
  
  return ret
}
