//
//  TowersOfHanoiV2Tests.swift
//  TowersOfHanoiV2Tests
//
//  Created by Don Clore on 3/5/23.
//

import XCTest
@testable import TowersOfHanoiV2

final class TowerOfHanoiV2Tests: XCTestCase {
  func testExample() {
    let n = 4
    let ret = tower_of_hanoi(n: n)
    
    let expectedArray: [[Int]] = [
      [1, 2],
      [1, 3],
      [2, 3],
      [1, 2],
      [3, 1],
      [3, 2],
      [1, 2],
      [1, 3],
      [2, 3],
      [2, 1],
      [3, 1],
      [2, 3],
      [1, 2],
      [1, 3],
      [2, 3]
    ]
    
    XCTAssertEqual(ret, expectedArray)
  }
  
  func testExample2() {
    let n = 3
    let ret = tower_of_hanoi(n: n)
    
    let expectedArray: [[Int]] = [
      [1, 3],
      [1, 2],
      [3, 2],
      [1, 3],
      [2, 1],
      [2, 3],
      [1, 3],
    ]
    
    XCTAssertEqual(ret, expectedArray)
  }
}
