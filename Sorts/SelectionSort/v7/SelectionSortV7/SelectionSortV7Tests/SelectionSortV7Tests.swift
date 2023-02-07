//
//  SelectionSortV7Tests.swift
//  SelectionSortV7Tests
//
//  Created by Don Clore on 2/6/23.
//

import XCTest
@testable import SelectionSortV7

final class SelectionSortV7Tests: XCTestCase {
  public func testInsertionSortV2() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
    //var numbers = [3, 2, 1]
    let sortedCopy = numbers.sorted()
    
    selectionSortV7(numbers: &numbers)
    
    for i in 0..<numbers.count {
      let numbersCandidate = numbers[i]
      let sortedCopyCandidate = sortedCopy[i]
        
      XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
}
