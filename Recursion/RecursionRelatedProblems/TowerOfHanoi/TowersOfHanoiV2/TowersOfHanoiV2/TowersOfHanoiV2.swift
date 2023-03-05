//
//  TowersOfHanoiV2.swift
//  TowersOfHanoiV2
//
//  Created by Don Clore on 3/5/23.
//

func tower_of_hanoi(n: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(n: Int, src: Int, dest: Int, aux: Int) {
    guard n > 1 else {
      ret.append([src, dest])
      return 
    }
    helper(n: n - 1, src: src, dest: aux, aux: dest)
    ret.append([src, dest])
    helper(n: n - 1, src: aux, dest: dest, aux: src)
  }
  
  helper(n:n, src: 1, dest: 3, aux: 2)
  return ret
}
