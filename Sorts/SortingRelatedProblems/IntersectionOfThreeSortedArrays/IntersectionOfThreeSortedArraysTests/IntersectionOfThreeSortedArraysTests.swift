//
//  IntersectionOfThreeSortedArraysTests.swift
//  IntersectionOfThreeSortedArraysTests
//
//  Created by Don Clore on 2/20/23.
//

import XCTest
@testable import IntersectionOfThreeSortedArrays

struct TestInput: Codable {
  let arr1: [Int]
  let arr2: [Int]
  let arr3: [Int]
}

final class IntersectionOfThreeSortedArraysTests: XCTestCase, ResourceTestable {
  func testFirstExample() {
    let a1 = [2, 5, 10]
    let a2 = [2, 3, 4, 10]
    let a3 = [2, 4, 10]
    
    let ret = find_intersection(arr1: a1, arr2: a2, arr3: a3)
    
    XCTAssertEqual([2, 10], ret)
    
  }
  
  func testSecondExample() {
    let a1 = [1, 2, 3]
    let a2: [Int] = []
    let a3 = [2, 2]
    
    let ret = find_intersection(arr1: a1, arr2: a2, arr3: a3)
    
    XCTAssertEqual([-1], ret)
  }
  
  func testThirdExample() {
    let a1 = [1, 2, 2, 2, 9]
    let a2 = [1, 1, 2, 2]
    let a3 = [1, 1, 1, 2, 2, 2]
    
    let ret = find_intersection(arr1: a1, arr2: a2, arr3: a3)
    
    XCTAssertEqual([1, 2, 2], ret)
  }
  
  func testTestCase16() {
    let data = getResourceData(named: "TestCase16", withExtension: "json")
    let decoder = JSONDecoder()
    do {
      let testCase = try decoder.decode(TestInput.self, from: data)
      let tc = testCase
      let a1 = tc.arr1
      let a2 = tc.arr2
      let a3 = tc.arr3
      let ret = find_intersection(arr1: a1, arr2: a2, arr3: a3)
    } catch {
      XCTFail()
    }
  }
  
}
