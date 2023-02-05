//
//  BubbleSortV3Tests.swift
//  BubbleSortV3Tests
//
//  Created by Don Clore on 2/4/23.
//

import XCTest
@testable import BubbleSortV3

final class BubbleSortV3Tests: XCTestCase {
  public func testBubbleSort() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
      let sortedCopy = numbers.sorted()
      
      bubbleSortV3(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }

}
