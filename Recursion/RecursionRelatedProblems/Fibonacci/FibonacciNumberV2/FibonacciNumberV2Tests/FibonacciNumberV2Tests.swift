//
//  FibonacciNumberV2Tests.swift
//  FibonacciNumberV2Tests
//
//  Created by Don Clore on 3/7/23.
//

import XCTest

@testable import FibonacciNumberV2

final class FibonacciNumberV2Tests: XCTestCase {
  
  func testFib() {
    var fibs: [Int] = []
    for i in 1...10 {
      let fib = find_fibonacci(n: i)
      fibs.append(fib)
    }
    
    let expected: [Int] = [
      1, 1, 2, 3, 5, 8, 13, 21, 34, 55,
    ]
    
    XCTAssertEqual(fibs, expected)
  }
}
