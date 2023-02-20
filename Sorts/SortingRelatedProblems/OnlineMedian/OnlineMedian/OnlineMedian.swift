//
//  OnlineMedian.swift
//  OnlineMedian
//
//  Created by Don Clore on 2/19/23.
//

func online_median(stream: [Int]) -> [Int] {
  var inserted: [Int] = []
  
  func findInsertionIndex(forN n: Int, start: Int, end: Int) -> Int {
    if end < start {
      return start
    }
    
    let mid = start + ((end - start) / 2)
    let candidate = inserted[mid]
    if candidate == n {
      return mid
    } else if candidate < n {
      return findInsertionIndex(forN: n, start: mid + 1, end: end)
    } else {
      return findInsertionIndex(forN: n, start: start, end: mid - 1)
    }
  }


  var ret: [Int] = []
  
  for (i,  n) in stream.enumerated() {
    let insertionIndex: Int
    if let first = inserted.first, n < first {
      insertionIndex = 0
    } else if let last = inserted.last, n > last {
      insertionIndex = inserted.count
    } else {
      insertionIndex = findInsertionIndex(forN: n, start: 0, end: inserted.count - 1)
    }
    
    inserted.insert(n, at: insertionIndex)
    
    let mid = inserted.count / 2
    if inserted.count.isMultiple(of: 2) {
      let midPoint1 = inserted[mid]
      let midpoint2 = inserted[mid - 1]
      let mean = (midPoint1 + midpoint2) / 2
      ret.append(mean)
    } else {
      ret.append(inserted[mid])
    }
  }
  return ret
}
