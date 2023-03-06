//
//  BinaryStringsV4Tests.swift
//  BinaryStringsV4Tests
//
//  Created by Don Clore on 3/6/23.
//

import XCTest
@testable import BinaryStringsV4

final class BinaryStringsV3Tests: XCTestCase {

  func testExample1() {
    let ret = binaryStrings(n:3)
    let expected = [
      "000",
      "001",
      "010",
      "011",
      "100",
      "101",
      "110",
      "111",
    ]
    
    XCTAssertEqual(expected, ret)
  }
  
  func testForSize0() {
    var ret = binaryStrings(n: 0)
    XCTAssertTrue(ret.isEmpty)
  }
  
  func testForSize1() {
    var ret = binaryStrings(n: 1)
    let expected = [
      "0",
      "1",
    ]
  }
}
