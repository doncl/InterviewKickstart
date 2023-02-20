//
//  IntersectionOfThreeSortedArrays.swift
//  IntersectionOfThreeSortedArrays
//
//  Created by Don Clore on 2/20/23.
//


func find_intersection(arr1: [Int], arr2: [Int], arr3: [Int]) -> [Int] {
  var a1 = arr1
  var a2 = arr2
  var a3 = arr3
  
  guard !a1.isEmpty, !a2.isEmpty, !a3.isEmpty else {
    return [-1]
  }
  
  var idx1 = 0
  var idx2 = 0
  var idx3 = 0
  
  var ret: [Int] = []
  
  while idx1 < a1.count && idx2 < a2.count && idx3 < a3.count {
    let firstNum = a1[idx1]
    let secondNum = a2[idx2]
    let thirdNum = a3[idx3]
    
    let allThreeEqual = firstNum == secondNum && secondNum == thirdNum
    if allThreeEqual {
      ret.append(firstNum)
      if idx1 == a1.count - 1 || idx2 == a2.count - 1 || idx3 == a3.count - 1 {
        break
      }
    }
    
    if idx1 == a1.count - 1 && idx2 == a2.count - 1 && idx3 == a3.count - 1 {
      break
    }
        
    if allThreeEqual {
      idx1 += 1
      idx2 += 1
      idx3 += 1
    } else if firstNum == secondNum && firstNum < thirdNum {
      idx1 += 1
      idx2 += 1
    } else if firstNum < secondNum && firstNum == thirdNum {
      idx1 += 1
      idx3 += 1
    } else if firstNum < secondNum && firstNum < thirdNum {
      idx1 += 1
    } else if firstNum < secondNum && firstNum > thirdNum {
      idx1 += 1
      idx3 += 1
    } else if firstNum == secondNum && thirdNum < firstNum {
      idx3 += 1
    } else if firstNum == thirdNum && secondNum < firstNum {
      idx2 += 1
    } else if firstNum > secondNum && firstNum > thirdNum {
      idx2 += 1
      idx3 += 1
    } else if firstNum > secondNum && firstNum == thirdNum {
      idx2 += 1
    } else if firstNum == secondNum && firstNum > thirdNum {
      idx3 += 1
    } else if firstNum > secondNum && firstNum == thirdNum {
      idx2 += 1
    } else if firstNum > secondNum && firstNum < thirdNum {
      idx1 += 1
    } else {
      fatalError("Missed a logical case!")
    }
    
  }
  
  if ret.isEmpty {
    return [-1]
  }
  return ret
}
