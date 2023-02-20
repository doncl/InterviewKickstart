//
//  TopKFrequentElementsTests.swift
//  TopKFrequentElementsTests
//
//  Created by Don Clore on 2/20/23.
//

import XCTest
@testable import TopKFrequentElements

final class TopKFrequentElementsTests: XCTestCase {

  func testFirstExample() {
    let arr: [Int] = [1, 2, 3, 2, 4, 3, 1]
    let k = 2
    
    let ret = find_top_k_frequent_elements(arr: arr, k: k)
    let retSet = Set<Int>(ret)
    let expectedSet = Set<Int>([3, 1])
    
    XCTAssertEqual(expectedSet, retSet)
  }
  
  func testSecondExample() {
    let arr: [Int] = [1, 2, 1, 2, 3, 1]
    let k = 1
    
    let ret = find_top_k_frequent_elements(arr: arr, k: k)
    let retSet = Set<Int>(ret)
    let expectedSet = Set<Int>([1])

    
    XCTAssertEqual([1], ret)
  }
}
