//
//  InsertionSortV2Tests.swift
//  InsertionSortV2Tests
//
//  Created by Don Clore on 2/4/23.
//

import XCTest
@testable import InsertionSortV2

final class InsertionSortV2Tests: XCTestCase {
  public func testInsertionSortV2() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      insertionSortV2(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }

}
