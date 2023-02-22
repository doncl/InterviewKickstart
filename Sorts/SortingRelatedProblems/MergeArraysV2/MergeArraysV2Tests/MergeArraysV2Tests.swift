//
//  MergeArraysV2Tests.swift
//  MergeArraysV2Tests
//
//  Created by Don Clore on 2/21/23.
//

import XCTest
@testable import MergeArraysV2

final class MergeArraysV2Tests: XCTestCase {
  func testFirstExample() {
    let first = [2, 3, 5]
    let second = [1, 4, 6, 0, 0, 0,]
    
    let merged = merge_one_into_another(first: first, second: second)
    
    XCTAssertEqual([1, 2, 3, 4, 5, 6], merged)
  }
  
  func testExample() {
    let first = [11, 14, 24, 34, 44, 45, 45, 47, 61, 64, 72, 82, 103, 104, 122, 122, 131, 138, 145, 148, 150, 151, 185, 198]
    let second = [6, 9, 17, 19, 28, 33, 35, 36, 64, 76, 87, 89, 107, 110, 112, 121, 129, 132, 139, 146, 151, 152, 154, 175, 0,
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let expected = [11, 14, 24, 34, 44, 45, 45, 47, 61, 64, 72, 82, 103, 104, 122, 122, 131, 138, 145, 148, 150, 151, 185, 198,
                  6, 9, 17, 19, 28, 33, 35, 36, 64, 76, 87, 89, 107, 110, 112, 121, 129, 132, 139, 146, 151, 152, 154, 175].sorted()
    
    let merged = merge_one_into_another(first: first, second: second)
                  
    XCTAssertEqual(expected, merged)                  
  }
  
  func testFailingExample() {
    /*
     "first": [1, 2, 3],
     "second": [4, 5, 6, 0, 0, 0]
     */
    
    let first = [1, 2, 3]
    let second = [4, 5, 6, 0, 0, 0]
    
    let merged = merge_one_into_another(first: first, second: second)
    
    let expected = [1, 2, 3, 4, 5, 6]
                  
    XCTAssertEqual(expected, merged)

  }
}
