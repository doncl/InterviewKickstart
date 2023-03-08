//
//  PrintAllSubsetsV1Tests.swift
//  PrintAllSubsetsV1Tests
//
//  Created by Don Clore on 3/7/23.
//

import XCTest
@testable import PrintAllSubsetsV1

final class PrintAllSubsetsV1Tests: XCTestCase {
  func test123() {
    let bank: [Int] = [1, 2, 3,]
    
    let ret = get_all_subsets(arr: bank)
    XCTAssertEqual(ret.count, 8)
    
    let retSet: Set<[Int]> = Set<[Int]>(ret)
    
    let expected: [[Int]] = [
      [],
      [1],
      [2],
      [3],
      [1, 2],
      [1, 3],
      [2, 3],
      [1, 2, 3,],
    ]
    
    let expectedSet: Set<[Int]> = Set<[Int]>(expected)
    
    XCTAssertEqual(retSet, expectedSet)
  }

}
