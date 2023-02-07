//
//  QuickSortV4Tests.swift
//  QuickSortV4Tests
//
//  Created by Don Clore on 2/7/23.
//

import XCTest
@testable import QuickSortV4

final class QuickSortV4Tests: XCTestCase {
  func testQuickSortV4() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
    let sortedCopy = numbers.sorted()
    
    quickSortV4(numbers: &numbers)
    
    for i in 0..<numbers.count {
        let numbersCandidate = numbers[i]
        let sortedCopyCandidate = sortedCopy[i]
        
        XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
   
}
