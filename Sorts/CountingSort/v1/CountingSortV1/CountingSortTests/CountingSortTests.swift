//
//  CountingSortTests.swift
//  CountingSortTests
//
//  Created by Don Clore on 2/9/23.
//

import XCTest
@testable import CountingSortV1

final class CountingSortTests: XCTestCase {

  public func testCountingSort() {
      //var numbers = [9, 1, 4, 4, 2, 8, 7, 6, 5]
      //var numbers = [5, 8, 3, 9, 4, 1, 7]
      var numbers = [-400000]
//    var numbers = [5, 8, 3, 9, 4, 1, 7]
      let sortedCopy = numbers.sorted()
      
      countingSort(numbers: &numbers)
      
      for i in 0..<numbers.count {
          let numbersCandidate = numbers[i]
          let sortedCopyCandidate = sortedCopy[i]
          
          XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
      }
  }
  
}
