//
//  CombinationFunctionTests.swift
//  CombinationFunctionTests
//
//  Created by Don Clore on 2/27/23.
//

import XCTest
@testable import CombinationFunction

final class CombinationFunctionTests: XCTestCase {
  func testOmkarsStatement() {
    let result1 = combination(numberInSet: 20, sizeOfSubset: 4)
    let result2 = combination(numberInSet: 20, sizeOfSubset: 16)
    
    XCTAssertEqual(result1, result2)
  }
  
  func testChessQuestion() {
    let result = combination(numberInSet: 64, sizeOfSubset: 8)
    print(result)
  }
  
  func testN() {
    let result = combination(numberInSet: 4, sizeOfSubset: 2)
    print(result)
  }
  
  func test15_5() {
    let result = combination(numberInSet: 15, sizeOfSubset: 5)
    print(result)
  }
}
