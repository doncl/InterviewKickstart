//
//  InsertSortV4Tests.swift
//  InsertSortV4Tests
//
//  Created by Don Clore on 2/6/23.
//

import XCTest
@testable import InsertionSortV4

final class InsertionSortV2Tests: XCTestCase {
  public func testInsertionSortV2() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
    //var numbers = [3, 2, 1]
    let sortedCopy = numbers.sorted()
    
    insertionSortV4(numbers: &numbers)
    
    for i in 0..<numbers.count {
      let numbersCandidate = numbers[i]
      let sortedCopyCandidate = sortedCopy[i]
        
      XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }

}
