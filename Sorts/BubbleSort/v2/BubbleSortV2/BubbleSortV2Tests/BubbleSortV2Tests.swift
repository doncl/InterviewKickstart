//
//  BubbleSortV2Tests.swift
//  BubbleSortV2Tests
//
//  Created by Don Clore on 2/3/23.
//

import XCTest
@testable import BubbleSortV2

final class BubbleSortTests: XCTestCase {
    public func testBubbleSortV2() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        bubbleSortV2(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }

}
