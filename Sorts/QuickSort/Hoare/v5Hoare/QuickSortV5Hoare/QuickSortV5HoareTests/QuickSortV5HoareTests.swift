//
//  QuickSortV5HoareTests.swift
//  QuickSortV5HoareTests
//
//  Created by Don Clore on 2/7/23.
//

import XCTest
@testable import QuickSortV5Hoare

final class QuickSortV5HoareTests: XCTestCase {
  func testQuickSortV5Hoare() {
    var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
//    var numbers = [4, 2, 8, 7, 1, 3, 5, 6]
    let sortedCopy = numbers.sorted()
    
    quickSortV5Hoare(numbers: &numbers)
    
    for i in 0..<numbers.count {
        let numbersCandidate = numbers[i]
        let sortedCopyCandidate = sortedCopy[i]
        
        XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
   
}
