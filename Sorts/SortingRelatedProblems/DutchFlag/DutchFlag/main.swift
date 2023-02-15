//
//  main.swift
//  DutchFlag
//
//  Created by Don Clore on 2/13/23.
//

import Foundation

func dutch_flag_sort(balls: [Character]) -> [Character] {
  var mutable = balls
   
   var low = 0
   var mid = 0
   var high = mutable.count - 1
   
   while mid <= high {
       switch mutable[mid] {
           case "R":
             mutable.swapAt(low, mid)
             low += 1
             mid += 1
             
           case "G":
              mid += 1
              break
              
           case "B":
             mutable.swapAt(high, mid)
             high -= 1
           
           default:
             fatalError("bad input")
       }
   }
  
   return mutable
}



//var balls: [Character] = ["G", "B", "G", "G", "R", "B", "R", "G"]
var balls: [Character] = ["R", "R", "G", "B", "B", "B", "B", "R", "G", "G", "G", "G"]

balls = dutch_flag_sort(balls: balls)

print(balls)
