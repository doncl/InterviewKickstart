//
//  BubbleSortV5Tests.swift
//  BubbleSortV5Tests
//
//  Created by Don Clore on 2/7/23.
//

import XCTest
@testable import BubbleSortV5

final class BubbleSortV5Tests: XCTestCase {
    public func testBubbleSort() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        bubbleSortV5(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }

}
