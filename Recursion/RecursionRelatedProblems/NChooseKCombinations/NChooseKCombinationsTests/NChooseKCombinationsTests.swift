//
//  NChooseKCombinationsTests.swift
//  NChooseKCombinationsTests
//
//  Created by Don Clore on 2/27/23.
//

import XCTest
@testable import NChooseKCombinations

final class NChooseKCombinationsTests: XCTestCase {
  func testExample1() {
    let result = find_combinations(n: 5, k: 2)
    
    let expected = Set<[Int]>([
      [1, 2],
      [1, 3],
      [1, 4],
      [1, 5],
      [2, 3],
      [2, 4],
      [2, 5],
      [3, 4],
      [3, 5],
      [4, 5],
    ])
    
    XCTAssertEqual(result.count, expected.count)
  
    let resultSet = Set<[Int]>(result)
    
    XCTAssertEqual(resultSet, expected)
    
  }
  
  func testExample2() {
    let result = find_combinations(n: 6, k: 6)
    XCTAssertEqual(result.count, 1)
    
    let resultSet = Set<Int>(result[0])
    let expectedSet = Set<Int>([1, 2, 3, 4, 5, 6])
    
    XCTAssertEqual(resultSet, expectedSet)
  }
  
  func testFailingExample() {
    let result = find_combinations(n: 15, k: 5)
    print(result)
  }
}
