//
//  ReviewAllRecursionProblemsV1Tests.swift
//  ReviewAllRecursionProblemsV1Tests
//
//  Created by Don Clore on 3/8/23.
//

import XCTest
@testable import ReviewAllRecursionProblemsV1

final class ReviewAllRecursionProblemsV1Tests: XCTestCase {
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
