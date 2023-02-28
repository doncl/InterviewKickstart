//
//  NChooseKCombinations.swift
//  NChooseKCombinations
//
//  Created by Don Clore on 2/27/23.
//


//// THIS IS BACKTRACKING
//func find_combinations(n: Int, k: Int) -> [[Int]] {
//  var result: [[Int]] = []
//
//  var array: [Int] = []
//  for i in 1...n {
//    array.append(i)
//  }
//
//  func constructCandidates(index: Int, a: [Int], k: Int) -> [Int] {
//    return Array(a[index...])
//  }
//
//  func helper(index: Int, kVal: Int, slate: inout [Int]) {
//    guard kVal != 0 else {
//      result.append(slate)
//      return
//    }
//
//    let candidates = constructCandidates(index: index, a: array, k: kVal)
//    for i in 0..<candidates.count {
//      let candidate = candidates[i]
//      slate.append(candidate)
//      helper(index: index + i + 1, kVal: kVal - 1, slate: &slate)
//      slate.removeLast()
//    }
//  }
//
//
//
//  var slate: [Int] = []
//
//  helper(index: 0, kVal: k, slate: &slate)
//
//  return result
//}

func find_combinations(n: Int, k: Int) -> [[Int]] {
  var comb = FindCombinations()
  let ret = comb.find_combinations(n: n, k: k)
  return ret
}


struct FindCombinations: Backtracker {
  var finished: Bool = false
  var desiredSize = 0
  var combinations: [[Int]] = []
  var input: [Int] = []
  var startingIndex = 0
  
  func isSolution(a: [Int], k: Int) -> Bool {
    return k == desiredSize
  }
  
  mutating func processSolution(a: [Int], k: Int) {
    combinations.append(a)
  }
  
  mutating func constructCandidates(a: [Int], index: Int, k: Int) -> [Int] {
    return input
  }
  
  mutating func makeMove(a: inout [Int], k: Int) {
  }
  
  mutating func unmakeMove(a: inout [Int], k: Int) {  }
  
  typealias entityType = Int
  
  mutating func find_combinations(n: Int, k: Int) -> [[Int]] {
    for i in 1...n {
      input.append(i)
    }
    
    desiredSize = k
    
    var slate: [Int] = []
    backTrack(a: &slate, index: 0, k: 0)
    return combinations
  }
}

protocol Backtracker {
  associatedtype entityType
  
  var finished: Bool { get }
  func isSolution(a: [entityType], k: Int) -> Bool
  mutating func processSolution(a: [entityType], k: Int)
  mutating func constructCandidates(a: [entityType], index: Int, k: Int) -> [entityType]
  
  mutating func makeMove(a: inout [entityType], k: Int)
  mutating func unmakeMove(a: inout [entityType], k: Int)
  
  mutating func backTrack(a: inout [entityType], index: Int, k: Int)
}

extension Backtracker {
  mutating func backTrack(a: inout [entityType], index: Int, k: Int) {
    if isSolution(a: a, k: k) {
      processSolution(a: a, k: k)
    } else {
      let candidates = constructCandidates(a: a, index: index, k: k)
      for i in index..<candidates.count {
        let candidate = candidates[i]
        a.append(candidate)
        makeMove(a: &a, k: k)
        backTrack(a: &a, index: i + 1, k: k + 1)
        unmakeMove(a: &a, k: k)
        a.removeLast()
        if finished {
          return
        }
      }
    }
  }
}
