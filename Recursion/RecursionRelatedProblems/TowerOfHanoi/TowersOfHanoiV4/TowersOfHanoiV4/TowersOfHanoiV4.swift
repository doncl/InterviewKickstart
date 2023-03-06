//
//  TowersOfHanoiV4.swift
//  TowersOfHanoiV4
//
//  Created by Don Clore on 3/5/23.
//

func towers_of_hanoi(n: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(n: Int, src: Int, dest: Int, aux: Int) {
    guard n > 0 else {
      return
    }
    
    helper(n: n - 1, src: src, dest: aux, aux: dest)
    ret.append([src, dest])
    helper(n: n - 1, src: aux, dest: dest, aux: src)
  }
  
  helper(n: n, src: 1, dest: 3, aux: 2)
  return ret
}
