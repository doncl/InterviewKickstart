//
//  FindKthLargestItemTests.swift
//  FindKthLargestItemTEsts
//
//  Created by Don Clore on 2/17/23.
//

import XCTest
@testable import FindKthLargestItem

final class FindKthLargestItemTests: XCTestCase {
  func testFindKthLargestItem() {
    var numbers = [5, 1, 10, 3, 2]
    var k = 2
    
    let kth = findKthLargestItem(numbers: &numbers, k: k)
    XCTAssertEqual(5, kth)
  }

}
