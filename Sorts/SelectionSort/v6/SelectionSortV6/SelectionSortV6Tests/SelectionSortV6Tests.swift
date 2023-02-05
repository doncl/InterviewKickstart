//
//  SelectionSortV6Tests.swift
//  SelectionSortV6Tests
//
//  Created by Don Clore on 2/5/23.
//

import XCTest
@testable import SelectionSortV6

final class SelectionSortV6Tests: XCTestCase {
  public func testSelectionSortV6() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      selectionSortV6(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }
}
