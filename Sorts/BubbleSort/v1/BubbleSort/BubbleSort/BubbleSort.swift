//
//  BubbleSort.swift
//  BubbleSort
//
//  Created by Don Clore on 2/3/23.
//

func bubbleSort(numbers: inout [Int]) {
    let start = numbers.count - 1
    for i in 0..<(numbers.count - 2) {        
        for j in stride(from: start, to: i, by: -1) {
            if numbers[j] < numbers[j - 1] {
                numbers.swapAt(j, j - 1)
            }
        }
    }    
}
