//
//  DecimalStringsNoRepetition.swift
//  DecimalStringsNoRepetition
//
//  Created by Don Clore on 3/6/23.
//

func decimalStrings(n: Int) -> [String] {
  var ret: [String] = []
  var digits: [String] = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
  ]
  
  func helper(build: inout String, bank: inout [String]) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<bank.count {
      let indexString = bank[i]
      bank.remove(at: i)
      build.append(indexString)
      helper(build: &build, bank: &bank)
      bank.insert(indexString, at: i)
      _ = build.popLast()
    }
  }
  
  var slate = ""
  helper(build: &slate, bank: &digits)
  return ret
}
