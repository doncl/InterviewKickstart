//
//  BinaryStringsV2.swift
//  BinaryStringsV2
//
//  Created by Don Clore on 3/5/23.
//

func binaryStrings(n: Int) -> [String] {
  guard n > 0 else {
    return []
  }
  var ret: [String] = []
  func helper(prefix: inout [Int]) {
    guard prefix.count < n else {
      var string: String = ""
      for n in prefix {
        string.append(String(n))
      }
      ret.append(string)
      return
    }
    
    prefix.append(0)
    helper(prefix: &prefix)
    _ = prefix.popLast()
    
    prefix.append(1)
    helper(prefix: &prefix)
    _ = prefix.popLast()
    
  }
  
  var build: [Int] = []
  
  helper(prefix: &build)
  return ret
  
}
