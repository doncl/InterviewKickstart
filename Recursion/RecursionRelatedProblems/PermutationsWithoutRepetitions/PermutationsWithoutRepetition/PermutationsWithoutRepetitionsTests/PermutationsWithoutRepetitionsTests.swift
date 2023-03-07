//
//  PermutationsWithoutRepetitionsTests.swift
//  PermutationsWithoutRepetitionsTests
//
//  Created by Don Clore on 3/6/23.
//

import XCTest
@testable import PermutationsWithoutRepetition

final class PermutationsWithoutRepetitionsTests: XCTestCase {
  func testABC() {
    let string = "ABC"
    
    let ret = permute(s: string)
    
    let expect = [
      "ABC",
      "ACB",
      "BAC",
      "BCA",
      "CAB",
      "CBA",
      ]
      
      XCTAssertEqual(expect, ret)
  }
}
