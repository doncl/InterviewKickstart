//
//  BinaryStringsV3.swift
//  BinaryStringsV3
//
//  Created by Don Clore on 3/5/23.
//

func binaryStrings(n: Int) {
  func binaryStrings(slate: String, n: Int) {
    guard n > 0 else {
      print(slate)
      return
    }
    
    binaryStrings(slate: slate + String("0"), n: n - 1)
    binaryStrings(slate: slate + String("1"), n: n - 1)
  }
  binaryStrings(slate: "", n: n)
}


