//
//  SortAllCharacters.swift
//  SortAllCharacters
//
//  Created by Don Clore on 2/19/23.
//

func sort_array(arr: [Character]) -> [Character] {
  for char: Character in arr {
    assert(char.isASCII)
  }
  
  var array = arr
  
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    let randomPivotIdx = Int.random(in: start...end)
    array.swapAt(start, randomPivotIdx)
    let pivot = array[start].asciiValue!
    
    var smaller = start
    for bigger in (start + 1)...end {
      if array[bigger].asciiValue! < pivot {
        smaller += 1
        array.swapAt(bigger, smaller)
      }
    }
    array.swapAt(start, smaller)
    
    helper(start: start, end: smaller - 1)
    helper(start: smaller + 1, end: end)        
  }
  
  helper(start: 0, end: array.count - 1)
  return array
}
