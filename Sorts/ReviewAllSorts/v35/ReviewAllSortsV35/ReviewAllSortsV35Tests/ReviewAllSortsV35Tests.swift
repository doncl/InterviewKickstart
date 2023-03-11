//
//  ReviewAllSortsV35Tests.swift
//  ReviewAllSortsV35Tests
//
//  Created by Don Clore on 3/11/23.
//


import XCTest
@testable import ReviewAllSortsV35

final class ReviewAllSortsV2Tests: XCTestCase {
  let numbers0 = [6, 3, 4, 6, 9, 2, 7, 111]
  let numbers1 = [5, 8, 3, 9, 4, 1, 7]
  let numbers2 = [-913743, 3241, 999999, 1243153, 0, 0, 999999999]
  let numbers3 = [5, 3, 1, -10, -11, -100]
  let numbers4 =  [-1000000000, 0, 1000000000]
  
  lazy var numbers: [[Int]] = [numbers0, numbers1, numbers2, numbers3, numbers4]
  
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
  
  // MARK:  Dutch flag problem
  func testDutchFlagBasicCase() {
    var balls: [Character] = ["R", "R", "G", "B", "B", "B", "B", "R", "G", "G", "G", "G"]
    
    dutch_flag_sort(balls: &balls)
    
    let expected: [Character] = ["R", "R", "R", "G", "G", "G", "G", "G", "B", "B", "B", "B"]
    
    XCTAssertEqual(balls, expected)
  }
  
  func testDutchFlagCaseFromPlatform() {
    var balls: [Character] =  ["G", "B", "G", "G", "R", "B", "R", "G"]
    
    dutch_flag_sort(balls: &balls)
    
    let expected: [Character] = ["R", "R", "G", "G", "G", "G", "B", "B"]
    
    XCTAssertEqual(balls, expected)
  }

  // MARK: Segregate odds and evens
  func testSimpleSegregateOddsAndEvensCase() {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 232, 433]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([2, 4, 6, 8, 10, 232, 7, 1, 9, 5, 3, 433], numbers)
  }

  func testEvenOddExample1() {
    var numbers = [1, 2, 3, 4]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([2, 4, 3, 1,], numbers)
  }
  
  func testEvenOddExample2() {
    var numbers = [4, 9, 5, 2, 9, 5, 7, 10]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([4, 2, 10, 9, 9, 5, 7, 5], numbers)
  }

  func testEvenOddExample10() {
    var numbers = [1, 2, 5]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([2, 1, 5], numbers)
  }
}

