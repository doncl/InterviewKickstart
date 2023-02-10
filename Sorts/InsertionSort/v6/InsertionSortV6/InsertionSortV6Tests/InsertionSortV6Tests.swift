//
//  InsertionSortV6Tests.swift
//  InsertionSortV6Tests
//
//  Created by Don Clore on 2/9/23.
//

import XCTest
@testable import InsertionSortV6

final class InsertionSortV6Tests: XCTestCase {
  public func testInsertionSortV3() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
    let sortedCopy = numbers.sorted()
    
    insertionSortV6(numbers: &numbers)
    
    for i in 0..<numbers.count {
      let numbersCandidate = numbers[i]
      let sortedCopyCandidate = sortedCopy[i]
      
      XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
}
