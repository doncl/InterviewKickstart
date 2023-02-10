//
//  InsertionSortV5Tests.swift
//  InsertionSortV5Tests
//
//  Created by Don Clore on 2/9/23.
//

import XCTest
@testable import InsertionSortV5

final class InsertionSortV5Tests: XCTestCase {
  public func testInsertionSortV5() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
    //var numbers = [3, 2, 1]
    let sortedCopy = numbers.sorted()
    
    insertionSort(numbers: &numbers)
    
    for i in 0..<numbers.count {
      let numbersCandidate = numbers[i]
      let sortedCopyCandidate = sortedCopy[i]
        
      XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }

}
