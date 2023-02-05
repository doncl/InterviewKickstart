//
//  InsertionSortV3Tests.swift
//  InsertionSortV3Tests
//
//  Created by Don Clore on 2/5/23.
//

import XCTest
@testable import InsertionSortV3

final class InsertionSortV3Tests: XCTestCase {
  public func testInsertionSortV3() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      insertionSortV3(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }

}
