//
//  OnlineMedianTests.swift
//  OnlineMedianTests
//
//  Created by Don Clore on 2/19/23.
//

import XCTest
@testable import OnlineMedian

struct ProblemInput: Codable {
  let stream: [Int]
}

final class OnlineMedianTests: XCTestCase, ResourceTestable {
  func testExample() {
    let stream = [3, 8, 5, 2]
    
    let median = online_median(stream: stream)
    XCTAssertEqual([3, 5, 5, 4], median)
  }
  
//  func testFailingExample() {
//    let data = getResourceData(named: "Problem8Input", withExtension: "json")
//    let expectedData = getResourceData(named: "Problem8Expected", withExtension: "json")
//
//    let decoder = JSONDecoder()
//
//    do {
//      let input = try decoder.decode(ProblemInput.self, from: data)
//      let stream = input.stream
//      let expected = try decoder.decode(ProblemInput.self, from: expectedData)
//      let expectedStream = expected.stream
//
//      let median = online_median(stream: stream)
//      print(median)
//
//      XCTAssertEqual(median.count, expectedStream.count)
//
//      for i in 0..<median.count {
//        let medianNum = median[i]
//        let expectedNum = expectedStream[i]
//
//        if medianNum != expectedNum {
//          print("foo")
//        }
//
//        XCTAssertEqual(medianNum, expectedNum, "Failed at index \(i)")
//      }
//
//    } catch {
//      XCTFail(error.localizedDescription)
//    }
//  }
  
  func testFirstEightNumbers() {

    let data = getResourceData(named: "Problem8Input", withExtension: "json")
    let expectedData = getResourceData(named: "Problem8Expected", withExtension: "json")
    
    let decoder = JSONDecoder()
    
    do {
      let input = try decoder.decode(ProblemInput.self, from: data)
      let stream = input.stream
      let expected = try decoder.decode(ProblemInput.self, from: expectedData)
      let expectedStream = expected.stream
      
      let median = online_median(stream: stream)
      print(median)
        
      XCTAssertEqual(median.count, expectedStream.count)
      
      for i in 0..<median.count {
        let medianNum = median[i]
        let expectedNum = expectedStream[i]
        
        if medianNum != expectedNum {
          print("foo")
        }
        
        XCTAssertEqual(medianNum, expectedNum, "Failed at index \(i)")
      }
      
    } catch {
      XCTFail(error.localizedDescription)
    }

  }
}
