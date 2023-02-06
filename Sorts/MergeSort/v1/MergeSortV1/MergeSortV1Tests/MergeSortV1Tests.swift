//
//  MergeSortV1Tests.swift
//  MergeSortV1Tests
//
//  Created by Don Clore on 2/5/23.
//

import XCTest
@testable import MergeSortV1

final class MergeSortV1Tests: XCTestCase {
  public func testMergeSortV1() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      mergeSortV1(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }

}
