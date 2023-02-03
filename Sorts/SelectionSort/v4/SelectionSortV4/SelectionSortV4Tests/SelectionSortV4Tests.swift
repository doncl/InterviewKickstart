//
//  SelectionSortV4Tests.swift
//  SelectionSortV4Tests
//
//  Created by Don Clore on 2/3/23.
//

import XCTest
@testable import SelectionSortV4

final class SelectionSortV4Tests: XCTestCase {

    public func testSelectionSort() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        selectionSortV4(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }
}
