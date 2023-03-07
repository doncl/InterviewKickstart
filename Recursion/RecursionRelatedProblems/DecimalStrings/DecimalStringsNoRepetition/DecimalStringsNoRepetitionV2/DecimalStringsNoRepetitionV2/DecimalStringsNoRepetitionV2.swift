//
//  DecimalStringsNoRepetitionV2.swift
//  DecimalStringsNoRepetitionV2
//
//  Created by Don Clore on 3/7/23.
//

func decimalStrings(n: Int) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout String, bank: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<bank.count {
      let index = bank.index(bank.startIndex, offsetBy: i)
      let candidate = bank[index]
      bank.remove(at: index)
      build.append(candidate)
      
      helper(build: &build, bank: &bank)
      
      bank.insert(candidate, at: index)
      _ = build.popLast()
    }
  }
  
  var bank: String = ""
  for i in 0...9 {
    bank.append(String(i))
  }
  
  var build = ""
  helper(build: &build, bank: &bank)
  
  return ret 
}
