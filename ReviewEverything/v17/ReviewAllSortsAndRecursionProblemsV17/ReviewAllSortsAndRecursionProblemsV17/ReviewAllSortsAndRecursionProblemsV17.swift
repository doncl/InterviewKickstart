//
//  ReviewAllSortsAndRecursionProblemsV17.swift
//  ReviewAllSortsAndRecursionProblemsV17
//
//  Created by Don Clore on 3/22/23.
//

func selectionSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var smallestIndex = i
    
    for j in (i + 1)..<numbers.count {
      if numbers[j] < numbers[smallestIndex] {
        smallestIndex = j
      }
    }
    if smallestIndex != i {
      numbers.swapAt(i, smallestIndex)
    }
  }
}

func bubbleSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    for j in stride(from: numbers.count - 1, to: i, by: -1) {
      if numbers[j] < numbers[j - 1] {
        numbers.swapAt(j, j - 1)
      }
    }
  }
}

func insertionSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var red = i - 1
    let temp = numbers[i]
    
    while red >= 0 && numbers[red] > temp {
      numbers[red + 1] = numbers[red]
      red -= 1
    }
    numbers[red + 1] = temp
  }
}

func mergeSort(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    let midpoint = start + (( end - start) / 2)
    helper(start: start, end: midpoint)
    helper(start: midpoint + 1, end: end)
    
    var aux: [Int] = []
    var leftIdx = start
    var rightIdx = midpoint + 1
    
    while leftIdx <= midpoint && rightIdx <= end {
      let leftNum = numbers[leftIdx]
      let rightNum = numbers[rightIdx]
      
      if leftNum <= rightNum {
        aux.append(leftNum)
        leftIdx += 1
      } else {
        aux.append(rightNum)
        rightIdx += 1
      }
    }
    
    if leftIdx <= midpoint {
      for i in leftIdx...midpoint {
        aux.append(numbers[i])
      }
    } else if rightIdx <= end {
      for i in rightIdx...end {
        aux.append(numbers[i])
      }
    }
    
    for i in 0..<aux.count {
      numbers[start + i] = aux[i]
    }
  }
  helper(start: 0, end: numbers.count - 1)
}

func quickSortLomuto(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    let randomPivotIdx = Int.random(in: start...end)
    numbers.swapAt(start, randomPivotIdx)
    let pivot = numbers[start]

    
    var smaller = start
    for bigger in (start + 1)...end {
      if numbers[bigger] <= pivot {
        smaller += 1
        numbers.swapAt(bigger, smaller)
      }
    }
    numbers.swapAt(start, smaller)
    helper(start: start, end: smaller - 1)
    helper(start: smaller + 1, end: end)
    
  }
  
  helper(start: 0, end: numbers.count - 1)
}

func quickSortHoare(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    let randomPivotIdx = Int.random(in: start...end)
    numbers.swapAt(start, randomPivotIdx)
    let pivot = numbers[start]
    
    var red = start + 1
    var green = end
    
    while green >= red {
      if numbers[red] <= pivot {
        red += 1
      } else if numbers[green] > pivot {
        green -= 1
      } else {
        numbers.swapAt(red, green)
      }
    }
    numbers.swapAt(start, green)
    
    helper(start: start, end: green - 1)
    helper(start: green + 1, end: end)
  }
  helper(start: 0, end: numbers.count - 1)
}

func heapSort(numbers: inout [Int]) {
  func getLeftChildIdx(forParentIdx index: Int) -> Int {
    index * 2 + 1
  }
  
  func getRightChildIdx(forParentIdx index: Int) -> Int {
    index * 2 + 2
  }

  func siftDown(from index: Int, upTo size: Int) {
    var parentIndex = index
    
    while true {
      let leftChild = getLeftChildIdx(forParentIdx: parentIndex)
      let rightChild = getRightChildIdx(forParentIdx: parentIndex)
      
      var candidateIndex = parentIndex
      
      if leftChild < size && numbers[leftChild] > numbers[candidateIndex] {
        candidateIndex = leftChild
      }
      
      if rightChild < size && numbers[rightChild] > numbers[candidateIndex] {
        candidateIndex = rightChild
      }
      
      guard candidateIndex != parentIndex else {
        return
      }
      
      numbers.swapAt(candidateIndex, parentIndex)
      parentIndex = candidateIndex
    }
  }
  
  for i in stride(from: numbers.count / 2 + 1, through: 0, by: -1) {
    siftDown(from: i, upTo: numbers.count)
  }
  
  for i in stride(from: numbers.count - 1, through: 0, by: -1) {
    numbers.swapAt(0, i)
    siftDown(from: 0, upTo: i)
  }
}

func dutch_flag_sort(balls: inout [Character]) {
  var blueThreshold = 0
  var greenThreshold = 0
  
  for i in 0..<balls.count {
    switch balls[i] {
      case "R":
        balls.swapAt(i, blueThreshold)
        balls.swapAt(blueThreshold, greenThreshold)
        blueThreshold += 1
        greenThreshold += 1
        
      case "G":
        balls.swapAt(i, blueThreshold)
        blueThreshold += 1
        
      default:
        break
    }
  }
}

func segregate_evens_and_odds(numbers: inout [Int]) {
  var threshold = 0
  for i in 0..<numbers.count {
    if numbers[i] % 2 == 0 {
      numbers.swapAt(i, threshold)
      threshold += 1
    }
  }
}


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
  
  var digits: String = "0123456789"
  
  func helper(build: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<digits.count {
      let stringindex = digits.index(digits.startIndex, offsetBy: i)
      let candidate = digits[stringindex]
      build.append(candidate)
      digits.remove(at: stringindex)
      helper(build: &build)
      digits.insert(candidate, at: stringindex)
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

  let digits: String = "0123456789"
  
  func helper(build: inout String) {
    guard build.count < n else {
      ret.append(build)
      return
    }
    
    for i in 0..<digits.count {
      let stringindex = digits.index(digits.startIndex, offsetBy: i)
      let candidate = digits[stringindex]
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
  var bank: [Int] = arr
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
  var bank: [Int] = arr
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
  var bank: [Character] = Array(s)
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
  var bank: [Character] = Array(s)
  helper(build: &build, bank: &bank, index: 0)

  return ret 
}

// MARK: GenerateStringSubsets
func generateAllStringSubsets(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout [Character], bank: [Character]) {
    guard !bank.isEmpty else {
      ret.append(String(build))
      return
    }
    
    let first = bank[0]
    let restOfArray = Array(bank[1...])
    
    // exclude
    helper(build: &build, bank: restOfArray)
    
    // include
    build.append(first)
    helper(build: &build, bank: restOfArray)
    _ = build.popLast()
  }

  var build: [Character] = []
  let bank: [Character] = Array(s)
  helper(build: &build, bank: bank)
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
    
    let first = bank[0]
    let restOfArray = Array(bank[1...])
    
    // exclude
    helper(build: &build, bank: restOfArray)
    
    // include
    build.append(first)
    helper(build: &build, bank: restOfArray)
    _ = build.popLast()
  }

  var build: [Int] = []
  let bank: [Int] = arr
  helper(build: &build, bank: bank)

  return ret
}

// MARK: GenerateIntSubsetAllowDuplicates
func generateIntSubsetsAllowDuplicates(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  let bank: [Int] = arr.sorted()
  
  func helper(build: inout [Int], index: Int) {
    guard index < bank.count else {
      ret.append(build)
      return
    }
    
    var loopindex = index
    var count = 0
    let candidate = bank[index]
    
    while loopindex < bank.count && bank[loopindex] == candidate {
      loopindex += 1
      count += 1
    }
    
    for copies in 0...count {
      for _ in 0..<copies {
        build.append(candidate)
      }
      helper(build: &build, index: index + count)
      
      for _ in 0..<copies {
        _ = build.popLast()
      }
    }
  }
  
  var build: [Int] = []
  helper(build: &build, index: 0)
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
    
    let stringindex = s.index(s.startIndex, offsetBy: index)
    let character = s[stringindex]
    if character.isNumber {
      build.append(character)
      helper(build: &build, index: index + 1)
      _ = build.popLast()
    } else {
      build.append(character.lowercased())
      helper(build: &build, index: index + 1)
      _ = build.popLast()

      build.append(character.uppercased())
      helper(build: &build, index: index + 1)
      _ = build.popLast()
    }
  }

  var build: String = ""
  helper(build: &build, index: 0)
  return ret
}

// MARK: Generate All Combinations that Sum Equal to Target
func generate_all_combinations(arr: [Int], target: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  let bank: [Int] = arr.sorted()
  
  func helper(build: inout [Int], index: Int, remaining: Int, target: Int) {
    guard target != 0 else {
      ret.append(build)
      return
    }
    guard target > 0 else {
      return
    }
    guard index < bank.count else {
      return
    }
    guard target <= remaining else {
      return
    }
    
    let candidate = bank[index]
    var loopindex = index
    var count = 0
    
    while loopindex < bank.count && bank[loopindex] == candidate {
      loopindex += 1
      count += 1
    }
    
    let exclusionRemaining = remaining - (count * candidate)
    helper(build: &build, index: loopindex, remaining: exclusionRemaining, target: target)
    
    for i in 1...count {
      build.append(candidate)
      let localSum = i * candidate
      let localRemaining = remaining - localSum
      let localTarget = target - localSum
      
      helper(build: &build, index: loopindex, remaining: localRemaining, target: localTarget)
    }
    
    for _ in 0..<count {
      _ = build.popLast()
    }
  }
  
  var build: [Int] = []
  let remaining = bank.reduce(0, +)
  helper(build: &build, index: 0, remaining: remaining, target: target)
    
  return ret
}

// MARK: Words From Phone Number
func get_words_from_phone_number(phone_number: String) -> [String] {
  var ret: [String] = []
  
  let map: [Character: [String]] = [
    "2": ["a", "b", "c",],
    "3": ["d", "e", "f",],
    "4": ["g", "h", "i",],
    "5": ["j", "k", "l",],
    "6": ["m", "n", "o",],
    "7": ["p", "q", "r", "s",],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z",],
  ]
  
  func helper(build: inout String, index: Int) {
    guard index < 7 else {
      ret.append(build)
      return
    }
    
    let stringIndex = phone_number.index(phone_number.startIndex, offsetBy: index)
    let digit = phone_number[stringIndex]
    if let letterArray = map[digit] {
      for letter in letterArray {
        build.append(letter)
        helper(build: &build, index: index + 1)
        _ = build.popLast()
      }
    } else {
      helper(build: &build, index: index + 1)
    }
  }
  
  var build: String = ""
  helper(build: &build, index: 0)
    
  return ret
}

// MARK: Palindromic Decomposition Of A String
func generate_palindromic_decompositions(s: String) -> [String] {
  var ret: [String] = []
  
  let bank: [Character] = Array(s)
  
  func isPalindrome(start: Int, end: Int) -> Bool {
    var start = start
    var end = end
    
    while start < end {
      if bank[start] != bank[end] {
        return false
      }
      
      start += 1
      end -= 1
    }
    return true
  }
  
  func helper(build: inout String, index: Int) {
    guard index < bank.count else {
      ret.append(build)
      return
    }
    
    var palindrome = ""
    for i in index..<bank.count {
      let candidate = bank[i]
      palindrome.append(candidate)
      
      if isPalindrome(start: index, end: i) {
        let stringToAppend = build.isEmpty ? palindrome : "|" + palindrome
        build.append(stringToAppend)
        helper(build: &build, index: i + 1)
        build.removeLast(stringToAppend.count)
      }
    }
  }
  
  var build: String = ""
  helper(build: &build, index: 0)
  
  return ret
}
