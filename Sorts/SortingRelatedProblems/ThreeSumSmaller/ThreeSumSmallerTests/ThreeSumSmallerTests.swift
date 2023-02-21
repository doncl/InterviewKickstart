//
//  ThreeSumSmallerTests.swift
//  ThreeSumSmallerTests
//
//  Created by Don Clore on 2/20/23.
//

import XCTest
@testable import ThreeSumSmaller

final class ThreeSumSmallerTests: XCTestCase {
  func testExampleOne() {
    let numbers = [5, 0, -1, 3, 2]
    let target = 4
    
    let ret = count_triplets(target: target, numbers: numbers)
    
    XCTAssertEqual(2, ret)
  }
  
  func testExampleTwo() {
    let numbers = [2, 2, 2, 1]
    let target = 7

    let ret = count_triplets(target: target, numbers: numbers)
    
    XCTAssertEqual(4, ret)
  }
}
