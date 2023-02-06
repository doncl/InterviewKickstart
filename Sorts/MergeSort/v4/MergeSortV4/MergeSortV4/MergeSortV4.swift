//
//  MergeSortV4.swift
//  MergeSortV4
//
//  Created by Don Clore on 2/5/23.
//

func merge_sort(arr: [Int]) -> [Int] {
    var numbers = arr
    
    func helper(start: Int, end: Int) {
        guard end - start > 0 else {
            return
        }
      
        let midIdx = start + ((end - start) / 2)
        
        helper(start: start, end: midIdx)
        helper(start: midIdx + 1, end: end)
        
        var aux: [Int] = []
        
        var leftIdx = start
        var rightIdx = midIdx + 1
        
        while leftIdx <= midIdx && rightIdx <= end {
            let leftNum = numbers[leftIdx]
            let rightNum = numbers[rightIdx]
            
            if leftNum <= rightNum {
                aux.append(leftNum)
                leftIdx += 1
            } else {
                aux.append(rightNum)
                rightIdx += 1
            }
        }
        
        if leftIdx <= midIdx {
            for i in leftIdx...midIdx {
                aux.append(numbers[i])
            }
        } else if rightIdx <= end {
            for i in rightIdx...end {
                aux.append(numbers[i])
            }
        }
        
        for i in 0..<aux.count {
            numbers[start + i] = aux[i]
        }
    }
    
    helper(start: 0, end: numbers.count - 1)
    
    return numbers
}

