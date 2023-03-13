//
//  ReviewAllRecursionProblemsV6.swift
//  ReviewAllRecursionProblemsV6
//
//  Created by Don Clore on 3/12/23.
//

// MARK: Fibonacci
func find_fibonacci(n: Int) -> Int {
  func fib(n: Int, base1: Int, base2: Int) -> Int {
    guard n > 0 else {
      return base1
    }
    return fib(n: n - 1, base1: base2, base2: base1 + base2)
  }
  
  return fib(n: n, base1: 0, base2: 1)
}

// MARK: NChooseK
func find_combinations(n: Int, k: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(build: inout [Int], bank: inout [Int], index: Int, kVal: Int) {
    guard kVal > 0 else {
      ret.append(build)
      return
    }
    
    for i in index..<bank.count {
      let candidate = bank[i]
      build.append(candidate)
      
      helper(build: &build, bank: &bank, index: i + 1, kVal: kVal - 1)
      
      _ = build.popLast()
    }
  }
  
  var array: [Int] = []
  for i in 1...n {
    array.append(i)
  }
  
  var build: [Int] = []
  
  helper(build: &build, bank: &array, index: 0, kVal: k)
  return ret
}

// MARK: TowersOfHanoi
func towers_of_hanoi(n: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(n: Int, src: Int, dst: Int, aux: Int) {
    guard n > 0 else {
      return
    }
    helper(n: n - 1, src: src, dst: aux, aux: dst)
    ret.append([src, dst])
    helper(n: n - 1, src: aux, dst: dst, aux: src)
  }
  
  helper(n: n, src: 1, dst: 3, aux: 2)
  
  return ret
}

// MARK: BinaryStrings
func binaryStrings(n: Int) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    build.append("0")
    helper(build: &build)
    _ = build.popLast()
    
    build.append("1")
    helper(build: &build)
    _ = build.popLast()
  }
  
  var build: String = ""
  helper(build: &build)
  return ret
}

// MARK: DecimalStringsNoRepetition
func decimalStringsNoRepetition(n: Int) -> [String] {
  var ret: [String] = []
  
 

  return ret
}

// MARK: DecimalStringsAllowRepetition
func decimalStringsAllowRepetition(n: Int) -> [String] {
  var ret: [String] = []
  
 
  return ret
}

// MARK: PermuteIntsWithoutRepetition
func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  
  return ret
}

// MARK: PermuteIntsAllowRepetitions
func permuteIntsAllowRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  return ret
}

// MARK: PermuteStringWithoutRepetition
func permuteStringWithoutRepetition(s: String) -> [String] {
  var ret: [String] = []
  
 
  return ret
}

// MARK: PermuteStringAllowRepetitions
func permuteStringAllowRepetitions(s: String) -> [String] {
  var ret: [String] = []
  
  return ret
}

// MARK: GenerateStringSubsets
func generateAllStringSubsets(s: String) -> [String] {
  var ret: [String] = []
  

  return ret
}

// MARK: GenerateAllIntSubsets
func generateAllIntSubsets(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  return ret
}

// MARK: GenerateIntSubsetAllowDuplicates
func generateIntSubsetsAllowDuplicates(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  return ret
}

// MARK: Letter case Permutation
// Given a string s, we can transform every letter individually to be lowercase or
// uppercase to create another string.  Return a list of all possible strings we
// could create.

func letter_case_permutation(s: String) -> [String] {
  var ret: [String] = []
  

  return ret
}

