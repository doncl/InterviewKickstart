//
//  QuickSortV2Tests.swift
//  QuickSortV2Tests
//
//  Created by Don Clore on 2/7/23.
//

import XCTest
@testable import QuickSortV2

final class QuickSortV2Tests: XCTestCase {
    public func testQuickSortV2() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        quickSortV2(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }

}
