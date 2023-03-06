//
//  DecimalStrings.swift
//  DecimalStrings
//
//  Created by Don Clore on 3/6/23.
//

func decimalStrings(n: Int) -> [String] {
  var ret: [String] = []
  
  func helper(slate: inout String, index: Int) {
    guard slate.count < n else {
      ret.append(slate)
      return
    }
 
    
    let digits: [String] = [
      "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    ]
    assert(index < digits.count)
    
    for i in index..<digits.count {
      let digit = digits[i]
      slate.append(digit)
      helper(slate: &slate, index: index)
      _ = slate.popLast()
    }
  }
  
  var slate = ""
  helper(slate: &slate, index: 0)
  return ret
}
