//
//  QuickSortV3Tests.swift
//  QuickSortV3Tests
//
//  Created by Don Clore on 2/7/23.
//

import XCTest
@testable import QuickSortV3

final class QuickSortV3Tests: XCTestCase {
  func testQuickSortV3() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
    let sortedCopy = numbers.sorted()
    
    quickSortV3(numbers: &numbers)
    
    for i in 0..<numbers.count {
        let numbersCandidate = numbers[i]
        let sortedCopyCandidate = sortedCopy[i]
        
        XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
   
}
