//
//  main.swift
//  MergeArrays
//
//  Created by Don Clore on 2/14/23.
//

import Foundation

//func merge_one_into_another(first: [Int], second: [Int]) -> [Int] {
//  var mutableSecond = second
//  var insertionPoint = first.count - 1
//  var beginningOfZerosPoint = first.count
//
//  var shift = 0
//
//  for i in stride(from: first.count - 1, through: 0, by: -1) {
//    let firstNum = first[i]
//    while insertionPoint >= 0 && firstNum < mutableSecond[insertionPoint] {
//      insertionPoint -= 1
//    }
//
//    var shiftStart = beginningOfZerosPoint
//    for j in stride(from: beginningOfZerosPoint, to: insertionPoint + 1, by: -1) {
//      mutableSecond[j] = mutableSecond[j - 1]
//    }
//
//    mutableSecond[insertionPoint + 1] = firstNum
//    beginningOfZerosPoint += 1
//  }
//
//
//  return mutableSecond
//}


//func merge_one_into_another(first: [Int], second: [Int]) -> [Int] {
//  var mutableSecond = second
//
//  var firstIdx = 0
//  var secondIdx = 0
//
//  while firstIdx < first.count && secondIdx < second.count {
//    let firstNum = first[firstIdx]
//    let secondNum = mutableSecond[secondIdx]
//
//    if firstNum <= secondNum {
//      for i in stride(from: mutableSecond.count - 1, to: secondIdx, by: -1) {
//        mutableSecond[i] = mutableSecond[i - 1]
//      }
//      mutableSecond[secondIdx] = firstNum
//      firstIdx += 1
//      secondIdx += 1
//    } else {
//      while secondIdx < second.count - 1 && firstNum > mutableSecond[secondIdx]  && mutableSecond[secondIdx] != 0 {
//        secondIdx += 1
//      }
//
//      for i in stride(from: mutableSecond.count - 1, to: secondIdx, by: -1) {
//        mutableSecond[i] = mutableSecond[i - 1]
//      }
//
//      mutableSecond[secondIdx] = firstNum
//      firstIdx += 1
//      secondIdx += 1
//    }
//  }
//
//  return mutableSecond
//}

//func merge_one_into_another(first: [Int], second: [Int]) -> [Int] {
//  var mutableSecond = second
//
//  var firstIdx = 0
//  var secondIdx = 0
//
//  while firstIdx < first.count && secondIdx < second.count {
//    let firstNum = first[firstIdx]
//    let secondNum = mutableSecond[secondIdx]
//
//
//    if firstNum > secondNum {
//        while secondIdx < second.count - 1 && firstNum > mutableSecond[secondIdx]  && mutableSecond[secondIdx] != 0 {
//            secondIdx += 1
//        }
//    }
//
//    for i in stride(from: mutableSecond.count - 1, to: secondIdx, by: -1) {
//        mutableSecond[i] = mutableSecond[i - 1]
//    }
//
//    mutableSecond[secondIdx] = firstNum
//    firstIdx += 1
//    secondIdx += 1
//  }
//
//  return mutableSecond
//}

func merge_one_into_another(first: [Int], second: [Int]) -> [Int] {
  guard !first.isEmpty else {
    return second
  }
  
  var aux: [Int] = []
  var firstIdx = 0
  var secondIdx = 0
  let firstArray = first
  let secondArray = Array(second[0..<first.count])
  
  while firstIdx < first.count && secondIdx < secondArray.count {
    let firstNum = firstArray[firstIdx]
    let secondNum = secondArray[secondIdx]
    
    if firstNum <= secondNum {
      aux.append(firstNum)
      firstIdx += 1
    } else {
      aux.append(secondNum)
      secondIdx += 1
    }
  }
  
  if firstIdx < first.count {
    for i in firstIdx..<first.count {
      aux.append(first[i])
    }
  } else if secondIdx < secondArray.count {
    for i in secondIdx..<secondArray.count {
      aux.append(second[i])
    }
  }
  
    
  return aux
}

//let first = [  185, 198]
//let second = [ 121, 0, 0,  ]


//let first = [1, 3, 5]
//let second = [2, 6, 7, 0, 0, 0]
//
//// expected = [1, 2, 3, 4, 5, 6]
///

//let first = [2]
//let second = [1, 0]

let first = [11, 14, 24, 34, 44, 45, 45, 47, 61, 64, 72, 82, 103, 104, 122, 122, 131, 138, 145, 148, 150, 151, 185, 198]
let second = [6, 9, 17, 19, 28, 33, 35, 36, 64, 76, 87, 89, 107, 110, 112, 121, 129, 132, 139, 146, 151, 152, 154, 175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]



let merged = merge_one_into_another(first: first, second: second)

print(merged)

