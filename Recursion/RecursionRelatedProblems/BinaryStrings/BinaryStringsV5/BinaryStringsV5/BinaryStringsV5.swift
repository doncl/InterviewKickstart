//
//  BinaryStringsV5.swift
//  BinaryStringsV5
//
//  Created by Don Clore on 3/7/23.
//

func binaryStrings(n: Int) -> [String] {
  var ret: [String] = []
  
  guard n > 0 else {
    return ret
  }
  
  func helper(build: String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    helper(build: build + "0")
    helper(build: build + "1")
  }
  
  var build = ""
  helper(build: build)
  
  return ret 
}
