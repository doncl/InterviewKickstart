//
//  FibonacciNumberV2.swift
//  FibonacciNumberV2
//
//  Created by Don Clore on 3/7/23.
//
func find_fibonacci(n: Int) -> Int {
  
  func helper(n: Int, base1: Int, base2: Int) -> Int {
    if n == 0 {
      return base1
    }
    
    return helper(n: n - 1, base1: base2, base2: base1 + base2)
  }
  
  let fib = helper(n: n, base1: 0, base2: 1)
  return fib
}

