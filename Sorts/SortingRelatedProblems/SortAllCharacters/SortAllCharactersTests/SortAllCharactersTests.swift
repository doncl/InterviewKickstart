//
//  SortAllCharactersTests.swift
//  SortAllCharactersTests
//
//  Created by Don Clore on 2/19/23.
//

import XCTest
@testable import SortAllCharacters

final class SortAllCharactersTests: XCTestCase {
  
  func testFirstExample() {
    let arr: [Character] = ["a", "s", "d", "f", "g", "*", "&", "!", "z", "y"]
    
    let ret: [Character] = sort_array(arr: arr)
    
    let expected: [Character] = ["!", "&", "*", "a", "d", "f", "g", "s", "y", "z"]
    
    XCTAssertEqual(ret, expected)
  }
}
