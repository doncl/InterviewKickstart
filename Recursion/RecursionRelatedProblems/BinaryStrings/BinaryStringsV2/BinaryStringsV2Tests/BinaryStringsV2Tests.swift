//
//  BinaryStringsV2Tests.swift
//  BinaryStringsV2Tests
//
//  Created by Don Clore on 3/5/23.
//

import XCTest
@testable import BinaryStringsV2

final class BinaryStringsV2Tests: XCTestCase {

  func testExample1() {
    let result = binaryStrings(n: 3)
    let expected: [String] = [
      "000",
      "001",
      "010",
      "011",
      "100",
      "101",
      "110",
      "111",
    ]
    
    XCTAssertEqual(result, expected)
  }
  
  func testForSize0() {
    let result = binaryStrings(n: 0)
    XCTAssertTrue(result.isEmpty)
  }
  
  func testForSize1() {
    let result = binaryStrings(n: 1)
    let expected: [String] = ["0", "1"]
    
    XCTAssertEqual(result, expected)
  }
}

