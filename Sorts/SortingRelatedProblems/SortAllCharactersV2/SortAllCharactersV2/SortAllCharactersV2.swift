//
//  SortAllCharactersV2.swift
//  SortAllCharactersV2
//
//  Created by Don Clore on 2/19/23.
//

import Foundation

func sort_array(arr: [Character]) -> [Character] {

  var map : [Int] = []
  
  var array = arr
  
  for char: Character in array {
    let val: Int = Int(char.asciiValue!)
    let size = val
    if map.count < size + 1 {
      map.append(contentsOf: Array(repeating: 0, count: size - map.count + 1))
    }
    map[val] += 1
  }
  
  var j = 0
  for index in 0..<map.count {
    let count = map[index]
    for _ in 0..<count {
      if let uint = UInt8(exactly: index) {
        let char = Character(UnicodeScalar(uint))
        array[j] = char
        j += 1
      }
    }
  }
  return array
}
