//
//  MergeSortV4Tests.swift
//  MergeSortV4Tests
//
//  Created by Don Clore on 2/5/23.
//

import XCTest
@testable import MergeSortV4

final class MergeSortV4Tests: XCTestCase {
  public func testMergeSortV4() {
      var numbers =  [5, 8, 3, 9, 4, 1, 7]
      let sortedCopy = numbers.sorted()
      
      numbers = merge_sort(arr: numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }
}
