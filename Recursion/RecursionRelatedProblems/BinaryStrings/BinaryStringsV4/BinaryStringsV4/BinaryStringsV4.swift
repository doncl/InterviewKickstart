//
//  BinaryStringsV4.swift
//  BinaryStringsV4
//
//  Created by Don Clore on 3/6/23.
//


func binaryStrings(n: Int) -> [String] {
  var ret: [String] = []
  guard n > 0 else {
    return ret
  }
  
  func helper(build: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    build.append("0")
    helper(build: &build)
    _ = build.popLast()
    
    build.append("1")
    helper(build: &build)
    _ = build.popLast()
  }
  
  var slate = ""
  helper(build: &slate)
  return ret
}
