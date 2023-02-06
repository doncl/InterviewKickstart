//
//  MergeSortV3.swift
//  MergeSortV3
//
//  Created by Don Clore on 2/5/23.
//


func mergeSortV3(numbers: inout [Int]) {
  func helper(start: Int, length: Int) {
    guard length > 1 else {
      return
    }
    
    let halfCount: Int = length / 2
    let halfIndex = start + halfCount
    let leftCount = halfCount
    let rightCount = length - halfCount
    
    helper(start: start, length: leftCount)
    helper(start: halfIndex, length: rightCount)
    
    var aux: [Int] = []
    var leftIdx: Int = start
    var rightIdx: Int = halfIndex
    
    while leftIdx < halfIndex && rightIdx < (start + length) {
      let leftNum = numbers[leftIdx]
      let rightNum = numbers[rightIdx]
      
      if leftNum < rightNum {
        aux.append(leftNum)
        leftIdx += 1
      } else {
        aux.append(rightNum)
        rightIdx += 1
      }
    }
    
    if leftIdx < halfIndex {
      for i in leftIdx..<halfIndex {
        let num = numbers[i]
        aux.append(num)
      }
    } else {
      for i in rightIdx..<(start + length) {
        let num = numbers[i]
        aux.append(num)
      }
    }
    
    assert(aux.count == length)
    for i in 0..<aux.count {
      numbers[start + i] = aux[i]
    }
  }
  
  helper(start: 0, length: numbers.count)
}
