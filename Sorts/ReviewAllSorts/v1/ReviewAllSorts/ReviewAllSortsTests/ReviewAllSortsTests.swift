//
//  ReviewAllSortsTests.swift
//  ReviewAllSortsTests
//
//  Created by Don Clore on 2/9/23.
//

import XCTest
@testable import ReviewAllSorts

final class ReviewAllSortsTests: XCTestCase {
  let numbers0 = [6, 3, 4, 6, 9, 2, 7, 111]
  let numbers1 = [5, 8, 3, 9, 4, 1, 7]
  let numbers2 = [-913743, 3241, 999999, 1243153, 0, 0, 999999999]
  let numbers3 = [-913743, 3241, 999999, 1243153, 0, 0, 999999999]
  
  lazy var numbers: [[Int]] = [numbers0, numbers1, numbers2, numbers3,]
  
  func testSelectionSort() {
    sortTestHelper(sort: selectionSort)
  }
  
  func testBubbleSort() {
    sortTestHelper(sort: bubbleSort)
  }
  
  func testInsertionSort() {
    sortTestHelper(sort: insertionSort)
  }
  
  func testMergeSort() {
    sortTestHelper(sort: mergeSort)
  }

  func testQuickSortLomuto() {
    sortTestHelper(sort: quickSortLomuto)
  }
  
  func testQuickSortHoare() {
    sortTestHelper(sort: quickSortHoare)
  }
  
  func testHeapSort() {
    sortTestHelper(sort: heapSort)
  }
  
  private func sortTestHelper(sort: (_ numbers: inout [Int]) -> ()) {
        
    numbers.forEach {
      let sortedCopy = $0.sorted()
      var mutable = $0
      sort(&mutable)
      compareNumbers(mutable, sortedCopy)
    }
  }
  
  private func compareNumbers(_ numbers: [Int], _ sortedCopy: [Int]) {
    for i in 0..<numbers.count {
      let numbersCandidate = numbers[i]
      let sortedCopyCandidate = sortedCopy[i]
      
      XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
}
