//
//  DecimalStringsAllowRepetitionV2.swift
//  DecimalStringsAllowRepetitionV2
//
//  Created by Don Clore on 3/7/23.
//

func decimalStrings(n: Int) -> [String] {
  var ret: [String] = []
  
  
  func helper(slate: inout String, nVal: Int) {

    guard nVal > 0 else {
      ret.append(slate)
      return
    }
    
    for i in 0...9 {
      let digit = String(i)
      slate.append(digit)
      helper(slate: &slate, nVal: nVal - 1 )
      _ = slate.popLast()
    }
  }
  
  var slate: String = ""
  helper(slate: &slate, nVal: n)
  return ret
}
