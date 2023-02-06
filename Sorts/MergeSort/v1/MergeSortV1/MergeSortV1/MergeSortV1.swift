//
//  MergeSortV1.swift
//  MergeSortV1
//
//  Created by Don Clore on 2/5/23.
//

func mergeSortV1(numbers: inout [Int]) {
  func merge(leftHalf: inout ArraySlice<Int>, rightHalf: inout ArraySlice<Int>) {
    var leftIdx: Int = 0
    var rightIdx: Int = 0
    let leftCount: Int = leftHalf.count
    let rightCount: Int = rightHalf.count
        
    var aux: [Int] =  []
    
    while leftIdx < leftCount && rightIdx < rightCount {
      
      let li = leftHalf.index(leftHalf.startIndex, offsetBy: leftIdx)
      let ri = rightHalf.index(rightHalf.startIndex, offsetBy: rightIdx)
      
      if leftHalf[li] > rightHalf[ri] {
        aux.append(rightHalf[ri])
        rightIdx += 1
      } else {
        aux.append(leftHalf[li])
        leftIdx += 1
      }
    }
    
    if leftIdx < leftCount {
      for i in leftIdx..<leftCount {
        let li = leftHalf.index(leftHalf.startIndex, offsetBy: i)
        aux.append(leftHalf[li])
      }
    } else if rightIdx < rightCount {
      for i in rightIdx..<rightCount {
        let ri = rightHalf.index(rightHalf.startIndex, offsetBy: i)
        aux.append(rightHalf[ri])
      }
    }
    
    for i in 0..<aux.count {
      if i < leftCount {
        let li = leftHalf.index(leftHalf.startIndex, offsetBy: i)
        leftHalf[li] = aux[i]
      } else {
        let ri = rightHalf.index(rightHalf.startIndex, offsetBy: i - leftCount)
        rightHalf[ri] = aux[i]
      }
    }
  }
  
  func helper(numbers: inout ArraySlice<Int>) {
    guard numbers.count > 1 else {
      return
    }
    let midpoint = numbers.count / 2
    let midIdx = numbers.index(numbers.startIndex, offsetBy: midpoint)
    var leftHalf = numbers[..<midIdx]
    var rightHalf = numbers[midIdx...]
    
    helper(numbers: &leftHalf)
    helper(numbers: &rightHalf)
  
    merge(leftHalf: &leftHalf, rightHalf: &rightHalf)
    numbers = leftHalf + rightHalf
  }
  
  helper(numbers: &numbers[0..<numbers.count])
}
