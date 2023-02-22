//
//  DutchFlagV2.swift
//  DutchFlagV2
//
//  Created by Don Clore on 2/21/23.
//
func dutch_flag_sort(balls: [Character]) -> [Character] {
  var balls = balls
  
  var startOfBlue = 0 // equals leftMostBlue
  var startOfGreen = 0
  
  for i in 0..<balls.count {
    let ball = balls[i]
    switch ball {
      case "R":
        balls.swapAt(i, startOfBlue)
        balls.swapAt(startOfBlue, startOfGreen)
        startOfBlue += 1
        startOfGreen += 1
        
      case "G":
        balls.swapAt(i, startOfBlue)
        startOfBlue += 1
        
      case "B":
        // do nothing
        break
        
      default:
        break
    }
  }

  return balls
}
