//
//  KMostFrequentWordsTests.swift
//  KMostFrequentWordsTests
//
//  Created by Don Clore on 2/20/23.
//

import XCTest
@testable import KMostFrequentWords

final class KMostFrequentWordsTests: XCTestCase {
  func testPlatformExample() {
    let words = ["car", "bus", "taxi", "car", "driver", "candy", "race", "car", "driver", "fare", "taxi"]
    
    let k = 4
    
    let ret = k_most_frequent(k: k, words: words)
    
    let expectedOutput = ["car", "driver", "taxi", "bus"]
    
    XCTAssertEqual(ret, expectedOutput)
  }
}
