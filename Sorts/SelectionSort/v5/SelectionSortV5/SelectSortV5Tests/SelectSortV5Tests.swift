//
//  SelectSortV5Tests.swift
//  SelectSortV5Tests
//
//  Created by Don Clore on 2/4/23.
//

import XCTest
@testable import SelectionSortV5

final class SelectSortV5Tests: XCTestCase {

  public func testSelectionSort() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
      let sortedCopy = numbers.sorted()
      
      selectionSortV5(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }
}
