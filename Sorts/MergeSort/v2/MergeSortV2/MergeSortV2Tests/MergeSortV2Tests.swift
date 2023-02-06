//
//  MergeSortV2Tests.swift
//  MergeSortV2Tests
//
//  Created by Don Clore on 2/5/23.
//

import XCTest
@testable import MergeSortV2

final class MergeSortV2Tests: XCTestCase {
  public func testMergeSortV2() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      mergeSortV2(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }
}
