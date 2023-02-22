//
//  MergeArraysV2.swift
//  MergeArraysV2
//
//  Created by Don Clore on 2/21/23.
//

func merge_one_into_another(first: [Int], second: [Int]) -> [Int] {
  guard !first.isEmpty else {
    return second
  }
  
  var first = first
  var second = second
  
  var p1 = first.count - 1
  var p2 = p1
  
  var end = second.count - 1
  
  while p1 >= 0 && p2 >= 0 {
    let num1 = first[p1]
    let num2 = second[p2]
    
    if num1 >= num2 {
      second[end] = num1
      p1 -= 1
    } else {
      second[end] = num2
      p2 -= 1
    }
    end -= 1
  }
  
  if p1 > -1 {
    for i in stride(from: p1, through: 0, by: -1) {
      second[i] = first[i]
    }
  } 
  
  return second 
}
