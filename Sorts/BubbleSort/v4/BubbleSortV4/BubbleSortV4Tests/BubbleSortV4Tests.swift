//
//  BubbleSortV4Tests.swift
//  BubbleSortV4Tests
//
//  Created by Don Clore on 2/5/23.
//

import XCTest
@testable import BubbleSortV4

final class BubbleSortV4Tests: XCTestCase {

  public func testBubbleSortV4() {
      var numbers = [6, 3, 4, 6, 9, 2, 7, 111, -3]
      let sortedCopy = numbers.sorted()
      
      bubbleSortV4(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }

}
