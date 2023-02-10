//
//  RadixSortV1Tests.swift
//  RadixSortV1Tests
//
//  Created by Don Clore on 2/10/23.
//

import XCTest
@testable import RadixSortV1

final class RadixSortV1Tests: XCTestCase {

  public func testCountingSort() {
//    let numbers0 = [9, 1, 4, 4, 2, 8, 7, 6, 5]
//    let numbers1 = [5, 8, 3, 9, 4, 1, 7]
//    let numbers2 = [-400000]
//    let numbers3 = [5, 8, 3, 9, 4, 1, 7]
//
//    lazy var numbers: [[Int]] = [numbers0, numbers1, numbers2, numbers3,]
    
    let numbersBook = [21, 345, 13, 101, 50, 234, 1]
    //let numbersNeg = [88, 410, -24, 1772, 20]
    lazy var numbers: [[Int]] = [numbersBook,]
    //lazy var numbers: [[Int]] = [numbersNeg,]
    
    for var numbersCandidate in numbers {
      testSort(numbers: &numbersCandidate)
    }
  }
  
  private func testSort(numbers: inout [Int]) {
    let sortedCopy = numbers.sorted()
    
    radixSort(numbers: &numbers)
    
    for i in 0..<numbers.count {
        let numbersCandidate = numbers[i]
        let sortedCopyCandidate = sortedCopy[i]
        
        XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }

}
