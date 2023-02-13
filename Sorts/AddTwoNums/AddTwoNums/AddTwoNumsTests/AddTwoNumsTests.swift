//
//  AddTwoNumsTests.swift
//  AddTwoNumsTests
//
//  Created by Don Clore on 2/11/23.
//

import XCTest
@testable import AddTwoNums

final class AddTwoNumsTests: XCTestCase {
  func testBinSearchWay() {
    let p = Program()
    var array = [3, 5, -4, 8, 11, 1, -1, 6]
    let target = 10
    
    let answer = p.twoNumberSum(&array, target)
    let sum = answer.reduce(0, +)
    
    XCTAssertEqual(sum, target)
  }
}
