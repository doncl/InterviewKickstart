//
//  ReviewAllSortsAndRecursionProblemsV19.swift
//  ReviewAllSortsAndRecursionProblemsV19
//
//  Created by Don Clore on 3/25/23.
//

func selectionSort(numbers: inout [Int]) {
  
}

func bubbleSort(numbers: inout [Int]) {
  
}

func insertionSort(numbers: inout [Int]) {
}

func mergeSort(numbers: inout [Int]) {
  
}

func quickSortLomuto(numbers: inout [Int]) {
  
}

func quickSortHoare(numbers: inout [Int]) {
  
}

func heapSort(numbers: inout [Int]) {
  
}

func dutch_flag_sort(balls: inout [Character]) {
}

func segregate_evens_and_odds(numbers: inout [Int]) {
}


// MARK: Fibonacci
func find_fibonacci(n: Int) -> Int {
  return 0
}

// MARK: NChooseK
func find_combinations(n: Int, k: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  return ret
}

// MARK: TowersOfHanoi
func towers_of_hanoi(n: Int) -> [[Int]] {
  var ret: [[Int]] = []
  
  
  return ret
}

// MARK: BinaryStrings
func binaryStrings(n: Int) -> [String] {
  var ret: [String] = []
  
 
  
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

// MARK: Generate All Combinations that Sum Equal to Target
func generate_all_combinations(arr: [Int], target: Int) -> [[Int]] {
  var ret: [[Int]] = []
    
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
  
    
  return ret
}

// MARK: Palindromic Decomposition Of A String
func generate_palindromic_decompositions(s: String) -> [String] {
  var ret: [String] = []
  
  return ret
}

// MARK: Check if Sum possible
func check_if_sum_possible(arr: [Int], k: Int) -> Bool {
  var result: Bool = false 
  let bank: [Int] = arr
  
  return result
}

// MARK: Find all Well-formed Brackets (parens)
func find_all_well_formed_brackets(n: Int) -> [String] {
  var ret: [String] = []
 
  return ret
}


// MARK: N Queens problem
func find_all_arrangements(n: Int) -> [[String]] {
  var ret: [[Int]] = []

  
  func generateOutput() -> [[String]] {
      func generateRowString(fromItemInRow row: Int) -> String {
        var string = ""
        for i in 0..<n {
          if row == i {
            string.append("q")
          } else {
            string.append("-")
          }
        }
        return string
      }

    var stringRet: [[String]] = []
    
    for i in 0..<ret.count {
      let solution = ret[i]
      var solutionStringArray: [String] = []
      for row in solution {
        let rowString = generateRowString(fromItemInRow: row)
        solutionStringArray.append(rowString)
      }
      stringRet.append(solutionStringArray)
    }
    return stringRet
  }

  
  
  let stringRet = generateOutput()
  return stringRet
}



