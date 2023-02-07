//
//  QuickSortV1Tests.swift
//  QuickSortV1Tests
//
//  Created by Don Clore on 2/7/23.
//

import XCTest
@testable import QuickSortV1

final class QuickSortV1Tests: XCTestCase {
    public func testQuickSortV1() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        quickSortV1(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }

}
