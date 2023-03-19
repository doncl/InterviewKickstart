//
//  ReviewAllSortsAndRecursionProblemsV8.swift
//  ReviewAllSortsAndRecursionProblemsV8
//
//  Created by Don Clore on 3/19/23.
//

func selectionSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var smallestIndex = i
    for j in (i + 1)..<numbers.count {
      if numbers[smallestIndex] > numbers[j] {
        smallestIndex = j
      }
    }
    if i != smallestIndex {
      numbers.swapAt(smallestIndex, i)
    }
  }
}

func bubbleSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    for j in stride(from: numbers.count - 1, to: i, by: -1) {
      if numbers[j - 1] > numbers[j] {
        numbers.swapAt(j - 1, j)
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
    
    let midpoint = start + ((end - start) / 2)
    
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
    numbers.swapAt(randomPivotIdx, start)
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
    numbers.swapAt(randomPivotIdx, start)
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
        red += 1
        green -= 1
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
      
      numbers.swapAt(parentIndex, candidateIndex)
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
    return fib(n: n - 1, base1: base2, base2: base2 + base1)
  }
  return fib(n: n, base1: 0, base2: 1)
}

// MARK: NChooseK
func find_combinations(n: Int, k: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  var array: [Int] = []
  for i in 1...n {
    array.append(i)
  }
  
  func helper(build: inout [Int], index: Int, kVal: Int) {
    guard kVal > 0 else {
      ret.append(build)
      return
    }
    
    for i in index..<n {
      let candidate = array[i]
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
  
  var bank = arr
  var build: [Int] = []
  
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
  
  var bank = arr
  var build: [Int] = []
  
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
  
  var bank = Array(s)
  var build: [Character] = []
  
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
  
  var bank = Array(s)
  var build: [Character] = []
  
  helper(build: &build, bank: &bank, index: 0)

  return ret 
}

// MARK: GenerateStringSubsets
func generateAllStringSubsets(s: String) -> [String] {
  var ret: [String] = []
  
  func helper(build: inout [Character], bank: [Character]) {
    guard bank.count > 0 else {
      ret.append(String(build))
      return
    }
    
    let firstChar = bank[0]
    let restOfArray = Array(bank[1...])
    
    // Exclude
    helper(build: &build, bank: restOfArray)
    
    // Include
    build.append(firstChar)
    helper(build: &build, bank: restOfArray)
    _ = build.popLast()
  }
  
  let bank = Array(s)
  var build: [Character] = []
  
  helper(build: &build, bank: bank)

  return ret
}

// MARK: GenerateAllIntSubsets
func generateAllIntSubsets(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []

  func helper(build: inout [Int], bank: [Int]) {
    guard bank.count > 0 else {
      ret.append(build)
      return
    }
    
    let firstInt = bank[0]
    let restOfArray = Array(bank[1...])
    
    // Exclude
    helper(build: &build, bank: restOfArray)
    
    // Include
    build.append(firstInt)
    helper(build: &build, bank: restOfArray)
    _ = build.popLast()
  }
  
  let bank = arr
  var build: [Int] = []
  
  helper(build: &build, bank: bank)

  return ret
}

// MARK: GenerateIntSubsetAllowDuplicates
func generateIntSubsetsAllowDuplicates(arr: [Int]) -> [[Int]] {
  var ret: [[Int]] = []
  
  let bank = arr
  
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
    
    let stringIndex = s.index(s.startIndex, offsetBy: index)
    let candidate = s[stringIndex]
    
    if candidate.isNumber {
      build.append(candidate)
      helper(build: &build, index: index + 1)
      _ = build.popLast()
    } else {
      build.append(candidate.lowercased())
      helper(build: &build, index: index + 1)
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

// MARK: Generate All Combinations that Sum Equal to Target
func generate_all_combinations(arr: [Int], target: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  let bank = arr.sorted()
  
  func helper(build: inout [Int], index: Int, remaining: Int, target: Int) {
    guard target != 0 else {
      ret.append(build)
      return
    }
    
    guard index < bank.count else {
      return
    }
    
    guard target > 0 else {
      return
    }
    
    guard target <= remaining else {
      return
    }
    
    var dupsEndIndex = index
    var dupsCount = 0
    let candidate = bank[index]
    
    while dupsEndIndex < bank.count && bank[dupsEndIndex] == candidate {
      dupsEndIndex += 1
      dupsCount += 1
    }
    
    let exclusionRemaining = remaining - (dupsCount * candidate)
    helper(build: &build, index: dupsEndIndex, remaining: exclusionRemaining, target: target)
    
    for dups in 1...dupsCount {
      build.append(candidate)
      let localSum = dups * candidate
      let localRemaining = remaining - localSum
      let localTarget = target - localSum
      
      helper(build: &build, index: dupsEndIndex, remaining: localRemaining, target: localTarget)
    }
    
    for _ in 0..<dupsCount {
      _ = build.popLast()
    }
  }
  
  var build: [Int] = []
  let localSum = bank.reduce(0, +)
  
  helper(build: &build, index: 0, remaining: localSum, target: target)
    
  return ret
}

// MARK: Words From Phone Number
func get_words_from_phone_number(phone_number: String) -> [String] {
  var ret: [String] = []
  
  let map: [String: [String]] = [
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
    let digit = String(phone_number[stringIndex])
    
    if let arrayOfLetters = map[digit] {
      for letter in arrayOfLetters {
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
      let char = bank[i]
      palindrome.append(char)
      
      if isPalindrome(start: index, end: i) {
        let stringToAppend = build.isEmpty ? palindrome : "|" + palindrome
        build.append(contentsOf: stringToAppend)
        helper(build: &build, index: i + 1)
        build.removeLast(stringToAppend.count)
      }
    }
  }
  
  var build: String = ""
  helper(build: &build, index: 0)
  
  return ret
}
