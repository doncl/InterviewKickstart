//
//  DutchFlagV4.swift
//  DutchFlagV4
//
//  Created by Don Clore on 2/22/23.
//

func dutch_flag_sort(balls: [Character]) -> [Character] {
  var balls = balls
  
  var leadingEdgeOfBlue = 0
  var leadingEdgeOfGreen = 0
  
  for i in 0..<balls.count {
    switch balls[i] {
      case "R":
        balls.swapAt(i, leadingEdgeOfBlue)
        balls.swapAt(leadingEdgeOfBlue, leadingEdgeOfGreen)
        leadingEdgeOfBlue += 1
        leadingEdgeOfGreen += 1
        
      case "G":
        balls.swapAt(i, leadingEdgeOfBlue)
        leadingEdgeOfBlue += 1
      case "B":
        break // do nothing
        
      default:
        break
    }
  }
  
  return balls
}

