//
//  DutchFlagV2.swift
//  DutchFlagV2
//
//  Created by Don Clore on 2/21/23.
//
func dutch_flag_sort(balls: [Character]) -> [Character] {
  var balls = balls
  
  var rightMostGreen = 0 // equals leftMostBlue
  var rightMostRed = 0
  
  for i in 0..<balls.count {
    let ball = balls[i]
    switch ball {
      case "R":
        balls.swapAt(i, rightMostGreen)
        balls.swapAt(rightMostGreen, rightMostRed)
        rightMostGreen += 1
        rightMostRed += 1
        
      case "G":
        balls.swapAt(i, rightMostGreen)
        rightMostGreen += 1
        
      case "B":
        // do nothing
        break
        
      default:
        break
    }
  }

  return balls
}
