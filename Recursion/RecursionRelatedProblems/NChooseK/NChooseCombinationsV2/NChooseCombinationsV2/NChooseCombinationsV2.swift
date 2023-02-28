//
//  NChooseCombinationsV2.swift
//  NChooseCombinationsV2
//
//  Created by Don Clore on 2/28/23.
//

func find_combinations(n: Int, k: Int) -> [[Int]] {
  var result: [[Int]] = []

  var array: [Int] = []
  for i in 1...n {
    array.append(i)
  }

  func constructCandidates(index: Int, a: [Int]) -> [Int] {
    return array
  }

  func helper(index: Int, slate: inout [Int]) {
    guard slate.count != k else {
      result.append(slate)
      return
    }

    let candidates = constructCandidates(index: index, a: array)
    for i in index..<candidates.count {
      print("\(#function) index = \(index) i = \(i), count = \(candidates.count)")
      let candidate = candidates[i]
      slate.append(candidate)
      helper(index: i + 1, slate: &slate)
      slate.removeLast()
    }
  }

  var slate: [Int] = []

  helper(index: 0, slate: &slate)

  return result
}

