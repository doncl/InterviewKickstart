//
//  MergeSortV2.swift
//  MergeSortV2
//
//  Created by Don Clore on 2/5/23.
//

func mergeSortV2(numbers: inout [Int]) {
  guard numbers.count > 1 else {
    return
  }
  
  let midPoint = numbers.count / 2
  var leftHalf = Array(numbers[0..<midPoint])
  var rightHalf = Array(numbers[midPoint...])
  
  mergeSortV2(numbers: &leftHalf)
  mergeSortV2(numbers: &rightHalf)
    
  var aux: [Int] = []

  var leftIdx: Int = 0
  var rightIdx: Int = 0
  let leftCount: Int = leftHalf.count
  let rightCount: Int = rightHalf.count
  
  while leftIdx < leftCount && rightIdx < rightCount {
    if leftHalf[leftIdx] < rightHalf[rightIdx] {
      aux.append(leftHalf[leftIdx])
      leftIdx += 1
    } else {
      aux.append(rightHalf[rightIdx])
      rightIdx += 1
    }
  }
  
  if leftIdx < leftCount {
    for i in leftIdx..<leftCount {
      aux.append(leftHalf[i])
    }
  } else if rightIdx < rightCount {
    for i in rightIdx..<rightCount {
      aux.append(rightHalf[i])
    }
  }

  numbers = aux
}
