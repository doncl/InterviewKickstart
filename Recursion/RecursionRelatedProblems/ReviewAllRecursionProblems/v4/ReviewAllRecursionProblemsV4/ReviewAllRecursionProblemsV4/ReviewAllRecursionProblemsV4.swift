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

// MARK: PermuteIntsWithoutRepetition - mutable, no slate
func permuteIntsWithoutRepetitions(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  func helper(array: inout [Int], index: Int) {
    guard index < array.count else {
      ret.append(array)
      return
    }
    
    for i in index..<array.count {
      array.swapAt(i, index)
      
      
      helper(array: &array, index: index + 1)
      
      array.swapAt(i, index)
    }
  }
  
  // array here is the bank, but it's also used as the build by
  // swapping elements around.
  var array = arr
  
  helper(array: &array, index: 0)
  
  return ret
}

// This one uses a slate, but also does the swapping.
func permuteIntsWithoutRepetitions2(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  
  func helper(bank: inout [Int], build: inout [Int], index: Int) {
    guard index < bank.count else {
      ret.append(build)
      return
    }
    
    for i in index..<bank.count {
      bank.swapAt(index, i)
      
      build.append(bank[index])
      helper(bank: &bank, build: &build, index: index + 1)
      _ = build.popLast()
      
      bank.swapAt(index, i)
    }
  }
  
  var bank = arr
  var build: [Int] = []
  helper(bank: &bank, build: &build, index: 0)
  
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
 
  func helper(bank: inout [Character], build: inout [Character], index: Int) {
    guard index < bank.count else {
      ret.append(String(build))
      return
    }
    
    for i in index..<bank.count {
      bank.swapAt(i, index)
      
      build.append(bank[index])
      
      helper(bank: &bank, build: &build, index: index + 1)
      
      _ = build.popLast()
      bank.swapAt(i, index)
    }
  }

  var build: [Character] = []
  var bank = Array(s)
  
  helper(bank: &bank, build: &build, index: 0)
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
        continue
      }
      
      seen.insert(candidate)
      
      build.append(candidate)
      
      helper(build: &build, bank: &bank, index: index + 1)
      
      _ = build.popLast()
      
      bank.swapAt(i, index)
    }
  }
  
  var bank = Array(s)
  var build: [Character] = []
  
  helper(build: &build, bank: &bank, index: 0)
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

// MARK: GenerateIntSubsetsAllowDuplicates
func generateIntSubsetsAllowDuplicates(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []

  func helper(build: inout [Int], bank: [Int], index: Int) {
    guard index < bank.count else {
      ret.append(build)
      return
    }

    let candidate = bank[index]
//    var count = 1 // we already have one copy
//    var j = index + 1
//    while j < bank.count && bank[j] == bank[index] {
//      j += 1
//      count += 1
//    }
    var count = 0
    for c in index..<bank.count {
      if bank[c] == bank[index] {
        count += 1
      } else {
        break 
      }
    }
    for copies in 0...count {
      for _ in 0..<copies {
        build.append(candidate)
      }
      helper(build: &build, bank: bank, index: index + count)

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

//func generateIntSubsetsAllowDuplicates(arr: [Int]) -> [[Int]] {
//  var ret: [[Int]] = []
//
//  func helper(build: inout [Int], bank: [Int], index: Int) {
//    guard index < bank.count else {
//      ret.append(build)
//      return
//    }
//
//    let candidate = bank[index]
//    var count = 1 // we already have one copy
//    var j = index + 1
//    while j < bank.count && bank[j] == bank[index] {
//      j += 1
//      count += 1
//    }
//
//    for _ in 1...count {
//      build.append(candidate)
//      helper(build: &build, bank: bank, index: index + count)
//    }
//
//    for _ in 1...count {
//      _ = build.popLast()
//    }
//  }
//
//  var build: [Int] = []
//  var bank = arr
//
//  helper(build: &build, bank: bank, index: 0)
//
//  return ret
//}


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


