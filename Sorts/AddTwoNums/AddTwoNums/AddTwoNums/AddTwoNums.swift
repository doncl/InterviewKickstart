//
//  AddTwoNums.swift
//  AddTwoNums
//
//  Created by Don Clore on 2/11/23.
//

//class Program {
//  func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
//    var sorted = array.sorted()
//    for i in 0..<sorted.count {
//      let firstNum = sorted[i]
//      let complement = targetSum - firstNum
//      guard complement != firstNum else {
//        continue
//      }
//      if let foundIndex = binarySearch(sorted, complement, start:i, end: array.count - 1) {
//        let foundNum = sorted[foundIndex]
//        return [firstNum, foundNum]
//      }
//    }
//    return []
//  }
//
//
//func binarySearch<T:Comparable>(_ inputArr:Array<T>, _ searchItem: T, start: Int, end: Int) -> Int? {
//    var lowerIndex = start
//    var upperIndex = end
//
//    while (true) {
//        let currentIndex = (lowerIndex + upperIndex)/2
//        if(inputArr[currentIndex] == searchItem) {
//            return currentIndex
//        } else if (lowerIndex > upperIndex) {
//            return nil
//        } else {
//            if (inputArr[currentIndex] > searchItem) {
//                upperIndex = currentIndex - 1
//            } else {
//                lowerIndex = currentIndex + 1
//            }
//        }
//    }
//  }
//}

// two pointer pass
class Program {
  func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    var sorted = array.sorted()

    var i = 0
    var j = sorted.count - 1

    while i < j {
      let complement = targetSum - sorted[i]
      if sorted[j] == complement {
        return [sorted[i], sorted[j]]
      } else if sorted[j] > complement {
          j -= 1
      } else {
          i += 1
      }
    }
   return []
  }
}

extension Array<Int>: Comparable {
  public static func < (lhs: Array<Element>, rhs: Array<Element>) -> Bool {
    if lhs[0] != rhs[0] {
      return lhs[0] < rhs[0]
    }
    
    if lhs[1] != rhs[1] {
      return lhs[1] < rhs[1]
    }
    
    if lhs[2] != rhs[2] {
      return lhs[2] < rhs[2]
    }
    
    return false
  }
}

func sortArrayArrays(arr: inout [[Int]]) {
  var set: Set<[Int]> = Set<[Int]>()
  arr.sort(by: { lhs, rhs in
    set.insert(lhs)
    let array = Array(set)

    if lhs[0] != rhs[0] {
      return lhs[0] < rhs[0]
    }
    
    if lhs[1] != rhs[1] {
      return lhs[1] < rhs[1]
    }
    
    if lhs[2] != rhs[2] {
      return lhs[2] < rhs[2]
    }
    
    return false
  })
}



extension MutableCollection where Self : RandomAccessCollection, Self.Element : Comparable {
  public static func < (lhs: Self, rhs: Self) -> Bool {
    var leftIndex = lhs.startIndex
    var rightIndex = rhs.startIndex
    
    if lhs[leftIndex] != rhs[rightIndex] {
      return lhs[leftIndex] < rhs[rightIndex]
    }
           
    leftIndex = lhs.index(after: leftIndex)
    rightIndex = rhs.index(after: rightIndex)
    
    if lhs[leftIndex] != rhs[rightIndex] {
      return lhs[leftIndex] < rhs[rightIndex]
    }

    leftIndex = lhs.index(after: leftIndex)
    rightIndex = rhs.index(after: rightIndex)

    if lhs[leftIndex] != rhs[rightIndex] {
      return lhs[leftIndex] < rhs[rightIndex]
    }
    
    return false
  }

}
