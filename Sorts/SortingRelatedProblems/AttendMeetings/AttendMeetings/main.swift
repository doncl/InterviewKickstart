//
//  main.swift
//  AttendMeetings
//
//  Created by Don Clore on 2/14/23.
//

import Foundation

func can_attend_all_meetings(intervals: [[Int]]) -> Int {
  var meetings = intervals
  func sortMeetings(meetings: inout [[Int]]) {
    func helper(start: Int, end: Int) {
      guard end > start else {
        return
      }
      
      let randomPivotIdx = Int.random(in: start...end)
      meetings.swapAt(start, randomPivotIdx)
      let pivot = meetings[start]
      
      var smaller = start
      for bigger in (start + 1)...end {
        if meetings[bigger][0] < pivot[0] {
          smaller += 1
          meetings.swapAt(bigger, smaller)
        }
      }
      meetings.swapAt(start, smaller)
      
      helper(start: start, end: smaller - 1)
      helper(start: smaller + 1, end: end)
    }
    
    helper(start: 0, end: intervals.count - 1)
  }
  
  sortMeetings(meetings: &meetings)
  
  for i in 1..<meetings.count {
    if meetings[i][0] < meetings[i - 1][1] {
      return 0
    }
  }

  return 1
}


//let intervals: [[Int]] = [[1, 5,], [5, 8,], [10, 15,],]

//let intervals: [[Int]] = [[10, 15,], [1, 5,], [5, 8,], ]
let intervals: [[Int]] = [
[13, 56],
[1, 3],
[4, 5],
[9990, 10341],
[8, 10],
[67, 9990]
]

let result = can_attend_all_meetings(intervals: intervals)

print(result == 1 ? "true" : "false")
