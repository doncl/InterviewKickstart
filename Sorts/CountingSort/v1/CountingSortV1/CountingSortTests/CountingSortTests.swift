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
    let numbers0 = [9, 1, 4, 4, 2, 8, 7, 6, 5]
    let numbers1 = [5, 8, 3, 9, 4, 1, 7]
    let numbers2 = [-400000]
    let numbers3 = [5, 8, 3, 9, 4, 1, 7]
    
    lazy var numbers: [[Int]] = [numbers0, numbers1, numbers2, numbers3,]

    for var numbersCandidate in numbers {
      testSort(numbers: &numbersCandidate)
    }
  }
  
  private func testSort(numbers: inout [Int]) {
    let sortedCopy = numbers.sorted()
    
    countingSort(numbers: &numbers)
    
    for i in 0..<numbers.count {
        let numbersCandidate = numbers[i]
        let sortedCopyCandidate = sortedCopy[i]
        
        XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
}
