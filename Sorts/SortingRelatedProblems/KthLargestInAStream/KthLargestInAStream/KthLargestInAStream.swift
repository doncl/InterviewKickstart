//
//  KthLargestInAStream.swift
//  KthLargestInAStream
//
//  Created by Don Clore on 2/19/23.
//


func kth_largest(k: Int, initial_stream: [Int], append_stream: [Int]) -> [Int] {
  var arr = initial_stream.sorted()
  
  func findInsertionIndex(forN n: Int, start: Int, end: Int) -> Int {
    if end <= start {
      return start
    }
    assert(end > start)
    
    let mid = start + ((end - start) / 2)
    let candidate = arr[mid]
    if candidate == n {
      return mid
    } else if candidate < n {
      return findInsertionIndex(forN: n, start: mid + 1, end: end)
    } else {
      return findInsertionIndex(forN: n, start: start, end: mid - 1)
    }
  }
  
  var ret: [Int] = []
  
  for n in append_stream {
    let insertionIndex: Int
    if let first = arr.first, n < first {
      insertionIndex = 0
    } else if let last = arr.last, n > last {
      insertionIndex = arr.count
    } else {
      insertionIndex = findInsertionIndex(forN: n, start: 0, end: arr.count - 1)
    }

    arr.insert(n, at: insertionIndex)
    let kthLargestIndex = arr.count - k
    let kthLargestItem = arr[kthLargestIndex]
    
    ret.append(kthLargestItem)
  }
  
  return ret
}

