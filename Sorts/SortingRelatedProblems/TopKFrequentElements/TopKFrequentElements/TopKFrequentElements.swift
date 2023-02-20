//
//  TopKFrequentElements.swift
//  TopKFrequentElements
//
//  Created by Don Clore on 2/20/23.
//

func find_top_k_frequent_elements(arr: [Int], k: Int) -> [Int] {
  let map = arr.reduce(into: [:]) { dict, num in
    dict[num, default: 0] += 1
  }
  
  var numbers = map.map { $0.key }
    
  let numbers = map.sorted(by: { lhs, rhs in
    lhs.value > rhs.value
  }).map { $0.key }
  
  return Array(numbers.prefix(k))
}

