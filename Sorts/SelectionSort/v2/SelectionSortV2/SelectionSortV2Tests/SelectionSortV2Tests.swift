//
//  SelectionSortV2Tests.swift
//  SelectionSortV2Tests
//
//  Created by Don Clore on 1/29/23.
//

import XCTest
@testable import SelectionSortV2

final class SelectionSortV2Tests: XCTestCase {

    public func testSelectionSort() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        selectionSortV2(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }
}
