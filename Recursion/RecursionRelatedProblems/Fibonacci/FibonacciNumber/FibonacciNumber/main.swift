//
//  main.swift
//  FibonacciNumber
//
//  Created by Don Clore on 3/6/23.
//

import Foundation

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


var fib = find_fibonacci(n: 2)

print(fib)

fib = find_fibonacci(n: 0)
print(fib)

fib = find_fibonacci(n: 1)
print(fib)

fib = find_fibonacci(n: 2)
print(fib)
