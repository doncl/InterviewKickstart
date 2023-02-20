//
//  SortAllCharactersV2Tests.swift
//  SortAllCharactersV2Tests
//
//  Created by Don Clore on 2/19/23.
//



import XCTest
@testable import SortAllCharactersV2

final class SortAllCharactersV2Tests: XCTestCase {
  
  func testFirstExample() {
    let arr: [Character] = ["a", "s", "d", "f", "g", "*", "&", "!", "z", "y"]
    
    let ret: [Character] = sort_array(arr: arr)
    
    let expected: [Character] = ["!", "&", "*", "a", "d", "f", "g", "s", "y", "z"]
    
    XCTAssertEqual(ret, expected)
  }
  
  func testFakeFirstFailure() {
    let arr: [Character] = Array(repeating: "t" as Character, count: 10000)
    
    let ret = sort_array(arr: arr)
    print("foo")
  }
}



/*
 func counting_sort(arr: [Int]) -> [Int] {
     var numbers = arr

   var posMap: [Int] = []
   var negMap: [Int] = []
   
   for i in 0..<numbers.count {
     let num = numbers[i]
     let size = abs(num)
     if num >= 0 {
       if posMap.count < size + 1 {
         posMap.append(contentsOf: Array(repeating: 0, count: (num - posMap.count + 1)))
       }
       posMap[num] = posMap[num] + 1
     } else {
       if negMap.count < size + 1 {
         negMap.append(contentsOf: Array(repeating: 0, count: (size - negMap.count + 1)))
       }
       negMap[size] = negMap[size] + 1
     }
   }
   
   var j = 0
   for negIndex in stride(from: negMap.count - 1, through: 0, by: -1) {
     let count = negMap[negIndex]
     for _ in 0..<count {
       numbers[j] = -negIndex
       j += 1
     }
   }
   for index in 0..<posMap.count {
     let count = posMap[index]
     for _ in 0..<count {
       numbers[j] = index
       j += 1
     }
   }
   
     return numbers
 }

 */
