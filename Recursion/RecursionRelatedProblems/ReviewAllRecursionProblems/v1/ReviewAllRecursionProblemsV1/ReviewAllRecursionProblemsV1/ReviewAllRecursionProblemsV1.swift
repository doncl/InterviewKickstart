//
//  ReviewAllRecursionProblemsV1.swift
//  ReviewAllRecursionProblemsV1
//
//  Created by Don Clore on 3/8/23.
//

// MARK: Fibonacci
func find_fibonacci(n: Int) -> Int {
  func helper(n: Int, base1: Int, base2: Int) -> Int {
    if n == 0 {
      return base1
    }
    return helper(n: n - 1, base1: base2, base2: base1 + base2)
  }
  return helper(n: n, base1: 0, base2: 1)
}

// MARK: NChooseK
func find_combinations(n: Int, k: Int) -> [[Int]] {
  var ret: [[Int]] = []
  var array: [Int] = []
  for i in 1...n {
    array.append(i)
  }
  
  func helper(slate: inout [Int], index: Int, kVal: Int) {
    guard kVal > 0 else {
      ret.append(slate)
      return
    }
    
    for i in index..<array.count {
      let candidate = array[i]
      slate.append(candidate)
      helper(slate: &slate, index: i + 1, kVal: kVal - 1)
      _ = slate.popLast()
    }
  }
  
  var slate: [Int] = []
  
  helper(slate: &slate, index: 0, kVal: k)
  
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
  
  func helper(slate: String) {
    guard slate.count < n else {
      ret.append(slate)
      return
    }
    
    helper(slate: slate + "0")
    helper(slate: slate + "1")
  }
  
  let slate: String = ""
  helper(slate: slate)
  
  return ret
}

// MARK: DecimalStringsNoRepetition
func decimalStringsNoRepetition(n: Int) -> [String] {
  var ret: [String] = []
  
  var digits: String = "0123456789"
  
  func helper(build: inout String, digits: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<digits.count {
      let stringIndex = digits.index(digits.startIndex, offsetBy: i)
      let candidate = digits[stringIndex]
      
      build.append(candidate)
      digits.remove(at: stringIndex)
      
      helper(build: &build, digits: &digits)
      
      digits.insert(candidate, at: stringIndex)
      _ = build.popLast()
    }
  }
  
  var build: String = ""
  
  helper(build: &build, digits: &digits)

  return ret
}

// MARK: DecimalStringsAllowRepetition
func decimalStringsAllowRepetition(n: Int) -> [String] {
  var ret: [String] = []
  
  let digits: String = "0123456789"
  
  func helper(build: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<digits.count {
      let stringIndex: String.Index = digits.index(digits.startIndex, offsetBy: i)
      let candidate = digits[stringIndex]
      build.append(candidate)
      
      helper(build: &build)
      
      _ = build.popLast()
    }
  }
  
  var build = ""
  helper(build: &build)
  return ret 
}

// MARK: PermuteIntsWithoutRepetition
func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(build: inout [Int], bank: inout [Int]) {
    guard build.count < arr.count else {
      ret.append(build)
      return
    }
    let count = bank.count
    for i in 0..<count {
      let candidate = bank[i]
      build.append(candidate)
      bank.remove(at: i)
      
      helper(build: &build, bank: &bank)
      
      bank.insert(candidate, at: i)
      _ = build.popLast()
    }
  }
  
  var build: [Int] = []
  var bank = arr
  
  helper(build: &build, bank: &bank)
  return ret
}

// MARK: PermuteStringWithoutRepetition
func permuteStringWithoutRepetition(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout String, bank: inout String) {
    guard build.count < s.count else {
      ret.append(build)
      return
    }
    
    let count = bank.count
    for i in 0..<count {
      let stringIndex: String.Index = bank.index(bank.startIndex, offsetBy: i)
      let candidate = bank[stringIndex]
      
      build.append(candidate)
      bank.remove(at: stringIndex)
      
      helper(build: &build, bank: &bank)
      
      bank.insert(candidate, at: stringIndex)
      _ = build.popLast()
    }
  }
  
  var build: String = ""
  var bank = s

  helper(build: &build, bank: &bank)
  return ret
}

// MARK: GenerateStringSubsets
func generateAllStringSubsets(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: String, bank: String) {
    guard !bank.isEmpty else {
      ret.append(build)
      return
    }
  
    let oneFromZero: String.Index = bank.index(bank.startIndex, offsetBy: 1)
    
    let stringWithFirstCharacterExcluded = String(bank[oneFromZero...])
    let stringOfFirstCharacter = String(bank[bank.startIndex..<oneFromZero])
    
    // exclude
    helper(build: build, bank: stringWithFirstCharacterExcluded)
    
    //include
    var newBuild = build
    newBuild.append(stringOfFirstCharacter)
    helper(build: newBuild, bank: stringWithFirstCharacterExcluded)
  }
  
  let build: String = ""
  let bank = s
  helper(build: build, bank: bank)
  return ret
}


// MARK: Letter case Permutation
// Given a string s, we can transform every letter individually to be lowercase or
// uppercase to create another string.  Return a list of all possible strings we
// could create.

func letter_case_permutation(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: String, index: Int) {
    guard build.count < s.count else {
      ret.append(build)
      return
    }
    
    let stringIndex: String.Index = s.index(s.startIndex, offsetBy: index)
    let char = s[stringIndex]
    if !char.isNumber {
      let alternateChar: String
      if char.isUppercase {
        alternateChar = char.lowercased()
      } else {
        alternateChar = char.uppercased()
      }
      
      helper(build: build + String(char), index: index + 1)
      helper(build: build + alternateChar, index: index + 1)
      
    } else {
      helper(build: build + String(char), index: index + 1)
    }
  }
  
  var build: String = ""
  helper(build: build, index: 0)
  return ret
}
