//
//  SelectionSortTests.swift
//  SelectionSortTests
//
//  Created by Don Clore on 1/29/23.
//

import XCTest
@testable import SelectionSort

final class SelectionSortTests: XCTestCase {

    public func testSelectionSort() {
        var numbers = [6, 3, 4, 6, 9, 2, 7, 111]
        let sortedCopy = numbers.sorted()
        
        selectionSort(numbers: &numbers)
        
        for i in 0..<numbers.count {
            let numbersCandidate = numbers[i]
            let sortedCopyCandidate = sortedCopy[i]
            
            XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
        }
    }
}
