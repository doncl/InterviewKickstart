//
//  PermuteIntsWithoutRepetition.swift
//  PermuteIntsWithoutRepetition
//
//  Created by Don Clore on 3/6/23.
//

func get_permutations(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  func helper(build: inout [Int], bank: inout [Int]) {
    guard build.count < arr.count else {
      ret.append(build)
      return
    }
    
    for i in 0..<bank.count {
      let candidate = bank[i]
      bank.remove(at: i)
      build.append(candidate)
      helper(build: &build, bank: &bank)
      _ = build.popLast()
      bank.insert(candidate, at: i)
    }
    
  }
    
  var build: [Int] = [ ]
  var bank = arr
  
  helper(build: &build, bank: &bank)
  return ret
}
