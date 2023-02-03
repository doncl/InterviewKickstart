//
//  SelectionSortV3Tests.swift
//  SelectionSortV3Tests
//
//  Created by Don Clore on 2/2/23.
//

import XCTest
@testable import SelectionSortV3

final class SelectionSortV3Tests: XCTestCase {

    public func testSelectionSort() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        selectionSortV3(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }
}

