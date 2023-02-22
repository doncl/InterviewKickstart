//
//  SegregateEvenAndOddV2Tests.swift
//  SegregateEvenAndOddV2Tests
//
//  Created by Don Clore on 2/21/23.
//

import XCTest
@testable import SegregateEvenAndOddV2

final class SegregateEvenAndOddV2Tests: XCTestCase {

  func testSimpleCase() {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 232, 433]
    
    let result = segregate_evens_and_odds(numbers: numbers)
    
    XCTAssertEqual([2, 4, 6, 8, 10, 232, 7, 1, 9, 5, 3, 433], result)
  }

}
