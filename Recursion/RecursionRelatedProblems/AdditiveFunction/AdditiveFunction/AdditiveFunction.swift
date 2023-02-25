//
//  AdditiveFunction.swift
//  AdditiveFunction
//
//  Created by Don Clore on 2/24/23.
//

func addSequence(n: Int, base1: Int, base2: Int) -> Int {
  guard n != 0 else {
    return base1
  }
  return addSequence(n: n - 1, base1: base2, base2: base1 + base2)
}
