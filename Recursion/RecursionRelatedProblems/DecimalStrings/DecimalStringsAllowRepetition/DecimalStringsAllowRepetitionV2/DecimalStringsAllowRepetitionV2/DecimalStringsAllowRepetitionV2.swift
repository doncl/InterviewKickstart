//
//  DecimalStringsAllowRepetitionV2.swift
//  DecimalStringsAllowRepetitionV2
//
//  Created by Don Clore on 3/6/23.
//

func decimalStrings(n: Int) -> [String] {
  var ret: [String] = []
  
  func helper(slate:String, n: Int) {
    guard n > 0 else {
      ret.append(slate)
      return
    }
    
    for i in 0...9 {
      let digit = String(i)
      let newSlate = slate + digit
      helper(slate: newSlate, n: n - 1)
    }
  }
  
  let slate = ""
  helper(slate: slate, n: n)
  return ret
}
