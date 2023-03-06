//
//  BinaryStringsV3Tests.swift
//  BinaryStringsV3Tests
//
//  Created by Don Clore on 3/5/23.
//

import XCTest
@testable import BinaryStringsV3

final class BinaryStringsV3Tests: XCTestCase {

  func testExample1() {
    binaryStrings(n:3)
  }
  
  func testForSize0() {
    binaryStrings(n: 0)
  }
  
  func testForSize1() {
   binaryStrings(n: 1)
  }
}

