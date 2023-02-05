//
//  InsertionSortTests.swift
//  InsertionSortTests
//
//  Created by Don Clore on 2/4/23.
//

import XCTest
@testable import InsertionSortV1

final class InsertionSortTests: XCTestCase {
  public func testInsertionSort() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      insertionSortV1(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }
}
