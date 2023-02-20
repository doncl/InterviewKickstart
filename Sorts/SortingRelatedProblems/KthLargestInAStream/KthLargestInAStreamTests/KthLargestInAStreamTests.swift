//
//  KthLargestInAStreamTests.swift
//  KthLargestInAStreamTests
//
//  Created by Don Clore on 2/19/23.
//

import XCTest
@testable import KthLargestInAStream

final class KthLargestInAStreamTests: XCTestCase {
  func testExample1() {
    let k = 2
    let initialStream = [4, 6]
    let appendStream = [5, 2, 20]
    
    let ret = kth_largest(k: k, initial_stream: initialStream, append_stream: appendStream)
    
    XCTAssertEqual([5, 5, 6], ret)
  }
  
}
