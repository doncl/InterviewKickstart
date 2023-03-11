//
//  ReviewAllRecursionProblemsV3.swift
//  ReviewAllRecursionProblemsV3
//
//  Created by Don Clore on 3/10/23.
//

// MARK: Fibonacci
func find_fibonacci(n: Int) -> Int {
  func helper(n: Int, base1: Int, base2: Int) -> Int {
    guard n > 0 else {
      return base1
    }
    return helper(n: n - 1, base1: base2, base2: base1 + base2)
  }
 return helper(n: n, base1: 0, base2: 1)
}

// MARK: NChooseK
func find_combinations(n: Int, k: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  var bank: [Int] = []
  for i in 1...n {
    bank.append(i)
  }
  
  func helper(build: inout [Int], bank: inout [Int], index: Int, kVal: Int) {
    guard kVal > 0 else {
      ret.append(build)
      return
    }
    
    let count = bank.count
    for i in index..<count {
      let candidate = bank[i]
      build.append(candidate)
      
      helper(build: &build, bank: &bank, index: i + 1, kVal: kVal - 1)
      
      _ = build.popLast()
    }
  }
  
  var build: [Int] = []
  
  helper(build: &build, bank: &bank, index: 0, kVal: k)
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
  
  func helper(build: String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    helper(build: build + "0")
    helper(build: build + "1")
  }
  
  helper(build: "")
  
  return ret
}

// MARK: DecimalStringsNoRepetition
func decimalStringsNoRepetition(n: Int) -> [String] {
  var ret: [String] = []
  var digits: String = "0123456789"
  
  
  func helper(build: inout String, bank: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    

    for i in 0..<bank.count {
      let stringIndex: String.Index = bank.index(bank.startIndex, offsetBy: i)
      let candidate = bank[stringIndex]
      bank.remove(at: stringIndex)
      build.append(candidate)
      
      helper(build: &build, bank: &bank)
      
      bank.insert(candidate, at: stringIndex)
      _ = build.popLast()
    }
  }
 
  var build: String = ""
  helper(build: &build, bank: &digits)
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
  
  var build: String = ""
 
  helper(build: &build)
  return ret
}

// MARK: PermuteIntsWithoutRepetition
//func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
//  var ret: [[Int]] = []
//
//  func helper(build: inout [Int], bank: inout [Int]) {
//    guard !bank.isEmpty else {
//      ret.append(build)
//      return
//    }
//
//    for i in 0..<bank.count {
//      let candidate = bank[i]
//
//      build.append(candidate)
//      bank.remove(at: i)
//
//      helper(build: &build, bank: &bank)
//
//      bank.insert(candidate, at: i)
//      _ = build.popLast()
//    }
//  }
//
//  var bank = arr
//  var build: [Int] = []
//
//  helper(build: &build, bank: &bank)
//
//  return ret
//}

//func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
//  var ret: [[Int]] = []
//
//  func helper(bank: inout [Int], index: Int) {
//    guard index < bank.count else {
//      ret.append(bank)
//      return
//    }
//
//    for pick in index..<bank.count {
//      if pick != index {
//        bank.swapAt(pick, index)
//      }
//
//      helper(bank: &bank, index: index + 1)
//
//      if pick != index {
//        bank.swapAt(pick, index)
//      }
//    }
//  }
//
//  var bank = arr
//
//  helper(bank: &bank, index: 0)
//
//  return ret
//}

func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []

  func helper(bank: inout [Int], index: Int) {
    guard index < bank.count else {
      ret.append(bank)
      return
    }

    for i in index..<bank.count {
      bank.swapAt(i, index)
      helper(bank: &bank, index: index + 1)
      bank.swapAt(i, index)
    }
  }

  var bank = arr

  helper(bank: &bank, index: 0)

  return ret
}


// MARK: PermuteStringWithoutRepetition
//func permuteStringWithoutRepetition(s: String) -> [String] {
//  var ret: [String] = []
//
//  func helper(build: inout String, bank: inout String) {
//    guard !bank.isEmpty else {
//      ret.append(build)
//      return
//    }
//
//    for i in 0..<bank.count {
//      let stringIndex: String.Index = bank.index(bank.startIndex, offsetBy: i)
//      let candidate = bank[stringIndex]
//      build.append(candidate)
//      bank.remove(at: stringIndex)
//
//      helper(build: &build, bank: &bank)
//
//      bank.insert(candidate, at: stringIndex)
//      _ = build.popLast()
//    }
//  }
//
//  var build: String = ""
//  var bank = s
//  helper(build: &build, bank: &bank)
//
//  return ret
//}

//func permuteStringWithoutRepetitions(s: String) -> [String] {
//  var ret: [String] = []
//
//  func swapCharacters(input: String, index1: Int, index2: Int) -> String {
//      var characters = Array(input)
//      characters.swapAt(index1, index2)
//
//      return String(characters)
//  }
//
//  func helper(slate: inout String, index: Int) {
//    guard index < slate.count else {
//      ret.append(slate)
//      return
//    }
//
//    for i in index..<slate.count {
//      if i != index {
//        slate = swapCharacters(input: slate, index1: i, index2: index)
//      }
//      let stringIndex = slate.index(slate.startIndex, offsetBy: i)
//      let candidate = slate[stringIndex]
//      slate.append(candidate)
//      helper(slate: &slate, index: index + 1)
//      _ = slate.popLast()
//      if i != index {
//        slate = swapCharacters(input: slate, index1: i, index2: index)
//      }
//    }
//  }
//
//  var slate = s
//  helper(slate: &slate, index: 0)
//
//  return ret
//}

// MARK: GenerateStringSubsets
func generateAllStringSubsets(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout String, bank: inout String) {
    guard !bank.isEmpty else {
      ret.append(build)
      return
    }
    
    let leftOneCharString = bank.remove(at: bank.startIndex)
    
    // exclusion
    helper(build: &build, bank: &bank)
                
    // inclusion
    build.append(leftOneCharString)
    helper(build: &build, bank: &bank)
    
    // backtrack
    bank.insert(leftOneCharString, at: bank.startIndex)
    _ = build.popLast()
  }
  

  var build: String = ""
  var bank = s
  helper(build: &build, bank: &bank)
  return ret
}

// MARK: GenerateAllIntSubsets
func generateAllIntSubsets(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(build: inout [Int], bank: inout [Int]) {
    guard !bank.isEmpty else {
      ret.append(build)
      return
    }
    
    let leftItem: Int = bank.remove(at: 0)
    
    // exclusion
    helper(build: &build, bank: &bank)
    
    // inclusion
 
    build.append(leftItem)
    helper(build: &build, bank: &bank)
    
    bank.insert(leftItem, at: 0)
    _ = build.popLast()
  }
  
  var build: [Int] = []
  var bank = arr
  
  helper(build: &build, bank: &bank)
  
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
    
    let stringIndex: String.Index = s.index(s.startIndex, offsetBy: index)
    let candidate = s[stringIndex]

    if candidate.isNumber {
      build.append(candidate)
      helper(build: &build, index: index + 1)
      _ = build.popLast()
    } else {
      build.append(candidate.lowercased())
      helper(build: &build, index:  index + 1)
      
      _ = build.popLast()
      
      build.append(candidate.uppercased())
      helper(build: &build, index: index + 1)
      _ = build.popLast()
    }
  }
  
  var build: String = ""
  helper(build: &build, index: 0)
  
  return ret
}

