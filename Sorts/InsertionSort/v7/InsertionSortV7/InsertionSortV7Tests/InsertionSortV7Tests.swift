//
//  InsertionSortV7Tests.swift
//  InsertionSortV7Tests
//
//  Created by Don Clore on 2/10/23.
//

import XCTest
@testable import InsertionSortV7

final class InsertionSortV7Tests: XCTestCase {
  public func testInsertionSortV7() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
    let sortedCopy = numbers.sorted()
    
    insertionSortV7(numbers: &numbers)
    
    for i in 0..<numbers.count {
      let numbersCandidate = numbers[i]
      let sortedCopyCandidate = sortedCopy[i]
      
      XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
}
