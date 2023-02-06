//
//  MergeSortV3Tests.swift
//  MergeSortV3Tests
//
//  Created by Don Clore on 2/5/23.
//

import XCTest
@testable import MergeSortV3

final class MergeSortV3Tests: XCTestCase {
  public func testMergeSortV3() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      mergeSortV3(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }
}
