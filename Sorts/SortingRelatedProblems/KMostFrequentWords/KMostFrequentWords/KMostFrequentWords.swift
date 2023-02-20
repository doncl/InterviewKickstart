//
//  KMostFrequentWords.swift
//  KMostFrequentWords
//
//  Created by Don Clore on 2/20/23.
//

func k_most_frequent(k: Int, words: [String]) -> [String] {
  let map = words.reduce(into: [:]) { dict, num in
    dict[num, default: 0] += 1
  }
  
  let sortedWords = map.sorted(by: { lhs, rhs in
    let lVal = lhs.value
    let rVal = rhs.value
    if lVal != rVal {
      return lVal > rVal
    }
    return lhs.key < rhs.key 
  })
  .map { $0.key }
  
  return Array(sortedWords.prefix(k))
}
