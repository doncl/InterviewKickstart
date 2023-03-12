//
//  ReviewAllRecursionProblemsV5.swift
//  ReviewAllRecursionProblemsV5
//
//  Created by Don Clore on 3/11/23.
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
  
  var bank: [Int] = []
  for i in 1...n {
    bank.append(i)
  }
  
  
  func helper(build: inout [Int], index: Int, kVal: Int) {
    guard kVal > 0 else {
      ret.append(build)
      return
    }
    
    for i in index..<bank.count {
      let candidate = bank[i]
      build.append(candidate)

      helper(build: &build, index: i + 1, kVal: kVal - 1)
      _ = build.popLast()
    }
  }
  
  var build: [Int] = []
  helper(build: &build, index: 0, kVal: k)
  
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
  
  guard n > 0 else {
    return ret
  }
  
  var digits: String = "0123456789"
  
  func helper(build: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<digits.count {
      let stringIndex = digits.index(digits.startIndex, offsetBy: i)
      let candidate = digits[stringIndex]
      
      build.append(candidate)
      digits.remove(at: stringIndex)
      
      helper(build: &build)
      
      digits.insert(candidate, at: stringIndex)
      
      _ = build.popLast()
    }
  }
 
  var build: String = ""
  helper(build: &build)
  return ret
}

// MARK: DecimalStringsAllowRepetition
func decimalStringsAllowRepetition(n: Int) -> [String] {
  var ret: [String] = []
  
  guard n > 0 else {
    return ret
  }
  
  let digits: String = "0123456789"
  
  func helper(build: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<digits.count {
      let stringIndex = digits.index(digits.startIndex, offsetBy: i)
      let candidate = digits[stringIndex]
      
      build.append(candidate)
      
      helper(build: &build)
      
      _ = build.popLast()
    }
  }
 
  var build: String = ""
  helper(build: &build)
  return ret
}

// MARK: PermuteIntsWithoutRepetition
func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(build: inout [Int], bank: inout [Int], index: Int) {
    guard index < bank.count else {
      ret.append(build)
      return
    }
    
    for i in index..<bank.count {
      bank.swapAt(i, index)
      let candidate = bank[index]
      build.append(candidate)
      
      helper(build: &build, bank: &bank, index: index + 1)
      
      _ = build.popLast()
      bank.swapAt(i, index)
    }
  }
  
  var build: [Int] = []
  var bank = arr
  helper(build: &build, bank: &bank, index: 0)
  return ret
}

// MARK: PermuteIntsAllowRepetitions
func permuteIntsAllowRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(build: inout [Int], bank: inout [Int], index: Int) {
    guard index < bank.count else {
      ret.append(build)
      return
    }
    
    var seen = Set<Int>()
    
    for i in index..<bank.count {
      bank.swapAt(i, index)
      let candidate = bank[index]
      
      if seen.contains(candidate) {
        bank.swapAt(i, index)
        continue
      }
      
      seen.insert(candidate)
      
      build.append(candidate)
      
      helper(build: &build, bank: &bank, index: index + 1)
      
      _ = build.popLast()
      bank.swapAt(i, index)
    }
  }
  
  var build: [Int] = []
  var bank = arr
  helper(build: &build, bank: &bank, index: 0)
  return ret

}

// MARK: PermuteStringWithoutRepetition
func permuteStringWithoutRepetition(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout [Character], bank: inout [Character], index: Int) {
    guard index < bank.count else {
      ret.append(String(build))
      return
    }
    
    for i in index..<bank.count {
      bank.swapAt(i, index)
      let candidate = bank[index]
    
      build.append(candidate)
      
      helper(build: &build, bank: &bank, index: index + 1)
      
      _ = build.popLast()
      bank.swapAt(i, index)
    }
  }
  
  var build: [Character] = []
  var bank = Array(s)
  helper(build: &build, bank: &bank, index: 0)
  return ret
}

// MARK: PermuteStringAllowRepetitions
func permuteStringAllowRepetitions(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout [Character], bank: inout [Character], index: Int) {
    guard index < bank.count else {
      ret.append(String(build))
      return
    }
    
    var seen = Set<Character>()
    
    for i in index..<bank.count {
      bank.swapAt(i, index)
      let candidate = bank[index]
      
      if seen.contains(candidate) {
        bank.swapAt(i, index)
        continue
      }
      
      seen.insert(candidate)
      
      build.append(candidate)
      
      helper(build: &build, bank: &bank, index: index + 1)
      
      _ = build.popLast()
      bank.swapAt(i, index)
    }
  }
  
  var build: [Character] = []
  var bank = Array(s)
  helper(build: &build, bank: &bank, index: 0)
  return ret
}

// MARK: GenerateStringSubsets
func generateAllStringSubsets(s: String) -> [String] {
  var ret: [String] = []
  
  let bank: [Character] = Array(s)
  
  func helper(build: inout [Character], bank: [Character]) {
    guard !bank.isEmpty else {
      ret.append(String(build))
      return
    }
    
    let firstChar = bank[0]
    let restOfarray = Array(bank[1...])
    
    // exclude
    helper(build: &build, bank: restOfarray)
  
    // include
    build.append(firstChar)
    helper(build: &build, bank: restOfarray)
    
    _ = build.popLast()

  }

  var build: [Character] = []
  
  helper(build: &build, bank: bank)
  return ret
}

// MARK: GenerateAllIntSubsets
func generateAllIntSubsets(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  let bank: [Int] = arr
  
  func helper(build: inout [Int], bank: [Int]) {
    guard !bank.isEmpty else {
      ret.append(build)
      return
    }
    
    let firstChar = bank[0]
    let restOfarray = Array(bank[1...])
    
    // exclude
    helper(build: &build, bank: restOfarray)
  
    // include
    build.append(firstChar)
    helper(build: &build, bank: restOfarray)
    
    _ = build.popLast()

  }

  var build: [Int] = []
  
  helper(build: &build, bank: bank)
  
  return ret
}

// MARK: GenerateIntSubsetAllowDuplicates
func generateIntSubsetsAllowDuplicates(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(build: inout [Int], bank: [Int], index: Int) {
    guard index < bank.count else {
      ret.append(build)
      return
    }
    
    let candidate = bank[index]
    var count = 0
    for j in index..<bank.count {
      guard bank[j] == candidate else {
        break
      }
      count += 1
    }
    
    for copies in 0...count {
      for _ in 0..<copies {
        build.append(candidate)
      }
      helper(build: &build, bank: bank, index: index + count )
     
      for _ in 0..<copies {
        _ = build.popLast()
      }
    }
  }
  
  var build: [Int] = []
  let bank = arr.sorted()
  helper(build: &build, bank: bank, index: 0)
  return ret
}

// MARK: Letter case Permutation
// Given a string s, we can transform every letter individually to be lowercase or
// uppercase to create another string.  Return a list of all possible strings we
// could create.

func letter_case_permutation(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout String, index: Int) {
    guard build.count < s.count else {
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

