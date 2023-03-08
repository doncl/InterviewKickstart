//
//  PrintAllSubsetsV1.swift
//  PrintAllSubsetsV1
//
//  Created by Don Clore on 3/7/23.
//

func get_all_subsets(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(slate: [Int], array: [Int]) {
    if array.count == 0 {
      ret.append(slate)
      return
    }
    
    // exclude
    let bagWithExcludedElement = Array(array[1...])
    helper(slate: slate, array: bagWithExcludedElement)
    
    // include
    var newSlate = slate
    newSlate.append(array[0])
    helper(slate: newSlate, array: bagWithExcludedElement)
  }
  
  let build: [Int] = []
  let bank = arr
  helper(slate: build, array: bank)
  return ret
}


