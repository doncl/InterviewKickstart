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

  func constructCandidates(index: Int, a: [Int], k: Int) -> [Int] {
    return array
  }

  func helper(index: Int, kVal: Int, slate: inout [Int]) {
     guard kVal != 0 else {
      result.append(slate)
      return
    }

    let candidates = constructCandidates(index: index, a: array, k: kVal)
    for i in index..<candidates.count {
      let candidate = candidates[i]
      slate.append(candidate)
      helper(index: i + 1, kVal: kVal - 1, slate: &slate)
      slate.removeLast()
    }
  }



  var slate: [Int] = []

  helper(index: 0, kVal: k, slate: &slate)

  return result
}

