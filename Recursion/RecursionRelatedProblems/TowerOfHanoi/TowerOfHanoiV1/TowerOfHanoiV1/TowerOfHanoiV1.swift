//
//  TowerOfHanoiV1.swift
//  TowerOfHanoiV1
//
//  Created by Don Clore on 2/28/23.
//

//func towerOfHanoi(n: Int, src: Int, dst: Int, aux: Int) {
//  if n == 1 {
//    print("Move disk from \(src) to \(dst)")
//  } else {
//    towerOfHanoi(n: n - 1, src: src, dst: aux, aux: dst)
//    print("Move disk from \(src) to \(dst)")
//    towerOfHanoi(n: n - 1, src: aux, dst: dst, aux: src)
//  }
//}

//func tower_of_hanoi(n: Int) -> [[Int]] {
//  var ret: [[Int]] = []
//
//  func helper(n: Int, src: Int, dst: Int, aux: Int) {
//    if n == 1 {
//      ret.append([src, dst])
//      return
//    }
//
//    helper(n: n - 1, src: src, dst: aux, aux: dst)
//    ret.append([src, dst])
//    helper(n: n - 1, src: aux, dst: dst, aux: src)
//  }
//
//  helper(n: n, src: 1, dst: 3, aux: 2)
//
//  return ret
//}

func tower_of_hanoi(n: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(n: Int, src: Int, dst: Int, aux: Int) {
    if n > 0 {
      helper(n: n - 1, src: src, dst: aux, aux: dst)
      ret.append([src, dst])
      helper(n: n - 1, src: aux, dst: dst, aux: src)
    }
  }
  helper(n: n, src: 1, dst: 3, aux: 2)

  return ret
}
