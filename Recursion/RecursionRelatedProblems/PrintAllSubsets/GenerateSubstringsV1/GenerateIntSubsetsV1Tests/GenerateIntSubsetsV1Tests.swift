//
//  GenerateIntSubsetsV1Tests.swift
//  GenerateIntSubsetsV1Tests
//
//  Created by Don Clore on 3/7/23.
//

import XCTest
@testable import GenerateStringSubsetsV1

final class GenerateStringSubsetsV1Tests: XCTestCase {

  func test123() {
    let ret = generate_all_subsets(s: "123")
    
    let retSet = Set<String>(ret)
    let expectSet = Set<String>([
      "",
      "3",
      "2",
      "23",
      "1",
      "13",
      "12",
      "123",
    ])
    
    XCTAssertEqual(retSet, expectSet)
  }

}
