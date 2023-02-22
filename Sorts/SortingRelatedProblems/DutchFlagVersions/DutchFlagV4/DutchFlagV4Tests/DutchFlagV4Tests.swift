//
//  DutchFlagV4Tests.swift
//  DutchFlagV4Tests
//
//  Created by Don Clore on 2/22/23.
//

import XCTest


import XCTest
@testable import DutchFlagV4

final class DutchFlagV4Tests: XCTestCase {
  func testBasicCase() {
    let balls: [Character] = ["R", "R", "G", "B", "B", "B", "B", "R", "G", "G", "G", "G"]
    
    let result = dutch_flag_sort(balls: balls)
    
    let expected: [Character] = ["R", "R", "R", "G", "G", "G", "G", "G", "B", "B", "B", "B"]
    
    XCTAssertEqual(result, expected)
  }
  
  func testCaseFromPlatform() {
    let balls: [Character] =  ["G", "B", "G", "G", "R", "B", "R", "G"]
    
    let result = dutch_flag_sort(balls: balls)
    
    let expected: [Character] = ["R", "R", "G", "G", "G", "G", "B", "B"]
    
    XCTAssertEqual(result, expected)
  }
}
