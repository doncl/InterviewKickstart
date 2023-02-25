//
//  AddtiveFunctionTests.swift
//  AddtiveFunctionTests
//
//  Created by Don Clore on 2/24/23.
//

import XCTest
@testable import AdditiveFunction

final class AddtiveFunctionTests: XCTestCase {
  func testForFib() {
    let nthFibNumber = addSequence(n: 10, base1: 0, base2: 1)
    
    let expected = 55
    XCTAssertEqual(nthFibNumber, expected)
  }
 
}
