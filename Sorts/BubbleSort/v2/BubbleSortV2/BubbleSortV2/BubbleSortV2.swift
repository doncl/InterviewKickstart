//
//  BubbleSortV2.swift
//  BubbleSortV2
//
//  Created by Don Clore on 2/3/23.
//

func bubbleSortV2(numbers: inout [Int]) {
    for i in 0..<numbers.count - 1 {
        for j in stride(from: numbers.count - 1, to: i, by: -1) {
            if numbers[j] < numbers[j - 1] {
                numbers.swapAt(j, j - 1)
            }
        }
    }
}
