//
//  ReviewAllRecursionProblemsV4.swift
//  ReviewAllRecursionProblemsV4
//
//  Created by Don Clore on 3/11/23.
//

// MARK: Fibonacci
func find_fibonacci(n: Int) -> Int {
  func helper(n: Int, base1: Int, base2: Int) -> Int {
    if n == 0 {
      return base1
    }
    
    return helper(n: n - 1, base1: base2, base2: base2 + base1)
  }
  return helper(n: n, base1: 0, base2: 1)
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
  
  guard n > 0 else {
    return ret 
  }
  
  func helper(build: inout String, index: Int) {
    guard index < n else {
      ret.append(build)
      return
    }
    build.append("0")
    helper(build: &build, index: index + 1)
    _ = build.popLast()
    
    build.append("1")
    helper(build: &build, index: index + 1)
    _ = build.popLast()
  }
  
  var build: String = ""
  
  helper(build: &build, index: 0)
  return ret
}

// MARK: DecimalStringsNoRepetition
func decimalStringsNoRepetition(n: Int) -> [String] {
  var ret: [String] = []
  
  let digits = "0123456789"
  
  func helper(build: inout String, bank: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<bank.count {
      let stringIndex = bank.index(bank.startIndex, offsetBy: i)
      let candidate = bank[stringIndex]
      build.append(candidate)
      bank.remove(at: stringIndex)
      
      helper(build: &build, bank: &bank)
      
      bank.insert(candidate, at: stringIndex)
      _ = build.popLast()
    }
  }
  
  var build: String = ""
  var bank = digits
  helper(build: &build, bank: &bank)

  return ret
}

// MARK: DecimalStringsAllowRepetition
func decimalStringsAllowRepetition(n: Int) -> [String] {
  var ret: [String] = []
  
  let digits = "0123456789"
  
  func helper(build: inout String, bank: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<bank.count {
      let stringIndex = bank.index(bank.startIndex, offsetBy: i)
      let candidate = bank[stringIndex]
      build.append(candidate)
      
      helper(build: &build, bank: &bank)
      
      _ = build.popLast()
    }
  }
  
  var build: String = ""
  var bank = digits
  helper(build: &build, bank: &bank)

 
  return ret
}

// MARK: PermuteIntsWithoutRepetition
func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  var build = arr
  
  func helper(build: inout [Int], index: Int) {
    guard index < build.count else {
      ret.append(build)
      return
    }
    
    for i in index..<build.count {
      build.swapAt(i, index)
      
      helper(build: &build, index: index + 1)
      
      build.swapAt(i, index)
    }
  }
  
  helper(build: &build, index: 0)
  
  return ret
}

// MARK: PermuteStringWithoutRepetition
func permuteStringWithoutRepetition(s: String) -> [String] {
  var ret: [String] = []
  var charArray = Array(s)
  
  func helper(index: Int) {
    guard index < charArray.count else {
      let string = String(charArray)
      ret.append(string)
      return
    }
    
    for i in index..<charArray.count {
      charArray.swapAt(i, index)
      helper(index: index + 1)
      charArray.swapAt(index, i)
    }
  }
  
  helper(index: 0)
  return ret
}

func generateAllStringSubsets(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout String, bank: String) {
    guard !bank.isEmpty else {
      ret.append(build)
      return
    }
    
    let firstChar = bank[build.startIndex]
    let index = bank.index(bank.startIndex, offsetBy: 1)
    let restOfString = String(bank[index...])
    
    // exclude
    helper(build: &build, bank: restOfString)
    
    // include
    build.append(firstChar)
    
    helper(build: &build, bank: restOfString)
    _ = build.popLast()
  }

  var build: String = ""
  helper(build: &build, bank: s)

  return ret
}

// MARK: GenerateAllIntSubsets
func generateAllIntSubsets(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(build: inout [Int], bank: [Int]) {
    guard !bank.isEmpty else {
      ret.append(build)
      return
    }
    let firstItem = bank[0]
    let restOfArray = Array(bank[1...])
    
    // EXCLUDE
    helper(build: &build, bank: restOfArray)
    
    // include
    build.append(firstItem)
    helper(build: &build, bank: restOfArray)
    _ = build.popLast()
  }
  
  var build: [Int] = []
  
  helper(build: &build, bank: arr)
  return ret
}

// MARK: Letter case Permutation
// Given a string s, we can transform every letter individually to be lowercase or
// uppercase to create another string.  Return a list of all possible strings we
// could create.

func letter_case_permutation(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout String, index: Int) {
    guard index < s.count else {
      ret.append(build)
      return
    }
    
    let stringIndex = s.index(s.startIndex, offsetBy: index)
    let char = s[stringIndex]
    
    if char.isNumber {
      build.append(char)
      helper(build: &build, index: index + 1)
      _ = build.popLast()
    } else {
      build.append(char.lowercased())
      helper(build: &build, index: index + 1)
      
      _ = build.popLast()
      build.append(char.uppercased())
      helper(build: &build, index: index + 1)
      _ = build.popLast()
    }

  }
  
  var build: String = ""
  helper(build: &build, index: 0)
  return ret
}


