//
//  CombinationFunction.swift
//  CombinationFunction
//
//  Created by Don Clore on 2/27/23.
//

func combination(numberInSet n: Int, sizeOfSubset k: Int) -> Int {
  if n <= 1 ||  k == 0 || k == n {
    return 1
  }
  let leftSideSum = combination(numberInSet: n - 1, sizeOfSubset: k)
  let rightSideSum = combination(numberInSet: n - 1, sizeOfSubset: k - 1)
  
  return leftSideSum + rightSideSum
}
