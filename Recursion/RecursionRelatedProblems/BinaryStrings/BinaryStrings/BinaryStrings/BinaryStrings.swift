//
//  BinaryStrings.swift
//  BinaryStrings
//
//  Created by Don Clore on 3/5/23.
//

func binaryStrings(n: Int) -> [String] {
  if n == 0 {
    return []
  }
  var result = ["0", "1"]
  if n == 1 {
    return result
  }
  
  for _ in 2...n {
    var newResult: [String] = []
    for s in result {
      newResult.append(s + "0")
      newResult.append(s + "1")
    }
    result = newResult
  }
  
  return result
}
