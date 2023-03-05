//
//  TowerOfHanoiV1Tests.swift
//  TowerOfHanoiV1Tests
//
//  Created by Don Clore on 2/28/23.
//

import XCTest
@testable import TowerOfHanoiV1

final class TowerOfHanoiV1Tests: XCTestCase {
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
