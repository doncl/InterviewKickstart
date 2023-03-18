

import XCTest
@testable import ReviewAllSortsAndRecursionProblemsV6

final class ReviewAllSortsAndRecursionProblemsV6Tests: XCTestCase {
  let numbers0 = [6, 3, 4, 6, 9, 2, 7, 111]
  let numbers1 = [5, 8, 3, 9, 4, 1, 7]
  let numbers2 = [-913743, 3241, 999999, 1243153, 0, 0, 999999999]
  let numbers3 = [5, 3, 1, -10, -11, -100]
  let numbers4 =  [-1000000000, 0, 1000000000]
  
  lazy var numbers: [[Int]] = [numbers0, numbers1, numbers2, numbers3, numbers4]
  
  func testSelectionSort() {
    sortTestHelper(sort: selectionSort)
  }
  
  func testBubbleSort() {
    sortTestHelper(sort: bubbleSort)
  }
  
  func testInsertionSort() {
    sortTestHelper(sort: insertionSort)
  }
  
  func testMergeSort() {
    sortTestHelper(sort: mergeSort)
  }

  func testQuickSortLomuto() {
    sortTestHelper(sort: quickSortLomuto)
  }
  
  func testQuickSortHoare() {
    sortTestHelper(sort: quickSortHoare)
  }
  
  func testHeapSort() {
    sortTestHelper(sort: heapSort)
  }

  // MARK:  Dutch flag problem
  func testDutchFlagBasicCase() {
    var balls: [Character] = ["R", "R", "G", "B", "B", "B", "B", "R", "G", "G", "G", "G"]
    
    dutch_flag_sort(balls: &balls)
    
    let expected: [Character] = ["R", "R", "R", "G", "G", "G", "G", "G", "B", "B", "B", "B"]
    
    XCTAssertEqual(balls, expected)
  }
  
  func testDutchFlagCaseFromPlatform() {
    var balls: [Character] =  ["G", "B", "G", "G", "R", "B", "R", "G"]
    
    dutch_flag_sort(balls: &balls)
    
    let expected: [Character] = ["R", "R", "G", "G", "G", "G", "B", "B"]
    
    XCTAssertEqual(balls, expected)
  }

  // MARK: Segregate odds and evens
  func testSimpleSegregateOddsAndEvensCase() {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 232, 433]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([2, 4, 6, 8, 10, 232, 7, 1, 9, 5, 3, 433], numbers)
  }

  func testEvenOddExample1() {
    var numbers = [1, 2, 3, 4]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([2, 4, 3, 1,], numbers)
  }
  
  func testEvenOddExample2() {
    var numbers = [4, 9, 5, 2, 9, 5, 7, 10]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([4, 2, 10, 9, 9, 5, 7, 5], numbers)
  }

  func testEvenOddExample10() {
    var numbers = [1, 2, 5]
    
    segregate_evens_and_odds(numbers: &numbers)
    
    XCTAssertEqual([2, 1, 5], numbers)
  }


  // MARK: RecursionTests

  func testFib() {
    var fibs: [Int] = []
    for i in 1...10 {
      let fib = find_fibonacci(n: i)
      fibs.append(fib)
    }
    
    let expected: [Int] = [
      1, 1, 2, 3, 5, 8, 13, 21, 34, 55,
    ]
    
    XCTAssertEqual(fibs, expected)
  }

  // MARK: NChooseK
  func testNChooseKExample1() {
    let result = find_combinations(n: 5, k: 2)
    
    let expected = Set<[Int]>([
      [1, 2],
      [1, 3],
      [1, 4],
      [1, 5],
      [2, 3],
      [2, 4],
      [2, 5],
      [3, 4],
      [3, 5],
      [4, 5],
    ])
    
    XCTAssertEqual(result.count, expected.count)
  
    let resultSet = Set<[Int]>(result)
    
    XCTAssertEqual(resultSet, expected)
  }
  
  func testNChooseKExample2() {
    let result = find_combinations(n: 6, k: 6)
    XCTAssertEqual(result.count, 1)
    
    guard result.count > 0 else {
      return
    }
    
    let resultSet = Set<Int>(result[0])
    let expectedSet = Set<Int>([1, 2, 3, 4, 5, 6])
    
    XCTAssertEqual(resultSet, expectedSet)
  }
  
  func testNChooseK2NumExample() {
    let result = find_combinations(n: 2, k: 2)
    XCTAssertEqual(result.count, 1)
    
    guard result.count > 0 else {
      return
    }
    
    let resultSet = Set<Int>(result[0])
    let expectedSet = Set<Int>([1, 2,])
    
    XCTAssertEqual(resultSet, expectedSet)
  }

  
  func testNChooseKFailingExample() {
    let result = find_combinations(n: 15, k: 5)
    print(result)
  }
  
  func testNChooseK20FailingExample() {
    let result = find_combinations(n: 20, k: 20)

    XCTAssertEqual(result.count, 1)
    
    guard result.count > 0 else {
      return
    }
    
    let resultSet = Set<Int>(result[0])
    let expectedSet = Set<Int>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
    
    XCTAssertEqual(resultSet, expectedSet)
  }

  // MARK: TowersOfHanoi
  func testTowersOfHanoiExample() {
    let n = 4
    let ret = towers_of_hanoi(n: n)
    
    let expectedArray: [[Int]] = [
      [1, 2],
      [1, 3],
      [2, 3],
      [1, 2],
      [3, 1],
      [3, 2],
      [1, 2],
      [1, 3],
      [2, 3],
      [2, 1],
      [3, 1],
      [2, 3],
      [1, 2],
      [1, 3],
      [2, 3]
    ]
    
    XCTAssertEqual(ret, expectedArray)
  }
  
  func testTowersOfHanoiExample2() {
    let n = 3
    let ret = towers_of_hanoi(n: n)
    
    let expectedArray: [[Int]] = [
      [1, 3],
      [1, 2],
      [3, 2],
      [1, 3],
      [2, 1],
      [2, 3],
      [1, 3],
    ]
    
    XCTAssertEqual(ret, expectedArray)
  }
  
  // MARK: BinaryStrings
  
  func testBinaryStringsExample1() {
    let ret = binaryStrings(n:3)
    let expected = [
      "000",
      "001",
      "010",
      "011",
      "100",
      "101",
      "110",
      "111",
    ]
    
    XCTAssertEqual(expected, ret)
  }
  
  func testBinaryStringsForSize0() {
    var ret = binaryStrings(n: 0)
    XCTAssertTrue(ret.isEmpty)
  }
  
  func testBinaryStringsForSize1() {
    var ret = binaryStrings(n: 1)
    let expected = [
      "0",
      "1",
    ]
    
    XCTAssertEqual(ret, expected)
  }
  
  // MARK: DecimalStringsNoRepetition
  func testDecimalStringsNoRepetitionLength1() {
    let ret = decimalStringsNoRepetition(n: 1)
    let expected = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
    ]
    
    XCTAssertEqual(ret, expected)
  }
  
  func testDecimalStringsNoRepetitionLength2() {
    let ret = decimalStringsNoRepetition(n: 2)
    let expected = [
      "01",
      "02",
      "03",
      "04",
      "05",
      "06",
      "07",
      "08",
      "09",
      
      "10",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      
      "20",
      "21",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      
      "30",
      "31",
      "32",
      "34",
      "35",
      "36",
      "37",
      "38",
      "39",
      
      "40",
      "41",
      "42",
      "43",
      "45",
      "46",
      "47",
      "48",
      "49",
      
      "50",
      "51",
      "52",
      "53",
      "54",
      "56",
      "57",
      "58",
      "59",
      
      "60",
      "61",
      "62",
      "63",
      "64",
      "65",
      "67",
      "68",
      "69",
      
      "70",
      "71",
      "72",
      "73",
      "74",
      "75",
      "76",
      "78",
      "79",
      
      "80",
      "81",
      "82",
      "83",
      "84",
      "85",
      "86",
      "87",
      "89",
      
      "90",
      "91",
      "92",
      "93",
      "94",
      "95",
      "96",
      "97",
      "98",
    ]
    
    XCTAssertEqual(ret, expected)
  }
  
  // MARK: DecimalStringsAllowRepetition
  func testDecimalStringsAllowRepetitionLength1() {
    let ret = decimalStringsAllowRepetition(n: 1)
    let expected = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
    ]
    
    XCTAssertEqual(ret, expected)
  }
  
  func testDecimalStringsAllowRepetitionLength2() {
    let ret = decimalStringsAllowRepetition(n: 2)
    let expected = [
      "00",
      "01",
      "02",
      "03",
      "04",
      "05",
      "06",
      "07",
      "08",
      "09",
      
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      
      "30",
      "31",
      "32",
      "33",
      "34",
      "35",
      "36",
      "37",
      "38",
      "39",
      
      "40",
      "41",
      "42",
      "43",
      "44",
      "45",
      "46",
      "47",
      "48",
      "49",
      
      "50",
      "51",
      "52",
      "53",
      "54",
      "55",
      "56",
      "57",
      "58",
      "59",
      
      "60",
      "61",
      "62",
      "63",
      "64",
      "65",
      "66",
      "67",
      "68",
      "69",
      
      "70",
      "71",
      "72",
      "73",
      "74",
      "75",
      "76",
      "77",
      "78",
      "79",
      
      "80",
      "81",
      "82",
      "83",
      "84",
      "85",
      "86",
      "87",
      "88",
      "89",
      
      "90",
      "91",
      "92",
      "93",
      "94",
      "95",
      "96",
      "97",
      "98",
      "99",
    ]
    
    XCTAssertEqual(ret, expected)
  }
  
  // MARK: PermuteIntsWithoutRepetitions
  func testPermuteIntsWithoutRepetitions123() {
    let array = [1, 2, 3,]
    
    let ret = permuteIntsWithoutRepetitions(arr: array)
    
     
    let retSet = Set<[Int]>(ret)
    
    let expect = [
      [1,2,3,],
      [1,3,2,],
      [2,1,3,],
      [2,3,1,],
      [3,1,2,],
      [3,2,1,],
    ]
      
    let expectSet = Set<[Int]>(expect)
      
    XCTAssertEqual(expectSet, retSet)      
  }
  
    func testPermuteIntsAllowRepetitions() {
    let array = [1, 1, 2,]
    
    let ret = permuteIntsAllowRepetitions(arr: array)
    
    let retSet = Set<[Int]>(ret)
    
    let expect = [
      [1,1, 2,],
      [1,2,1],
      [2,1,1],
    ]
    
    let expectSet = Set<[Int]>(expect)
      
    XCTAssertEqual(expectSet, retSet)
  }
  
   // MARK: PermuteStringWithoutRepetition
  func testABC() {
    let string = "ABC"
    
    let ret = permuteStringWithoutRepetition(s: string)
    let retSet = Set<String>(ret)
    
    let expect = [
      "ABC",
      "ACB",
      "BAC",
      "BCA",
      "CBA",
      "CAB",
      ]
    
    let expectSet = Set<String>(expect)
      
    XCTAssertEqual(expectSet, retSet)
  }
  
  // MARK: PermuteStringAllowRepetition
  func testPermuteStringAllowRepetition() {
    let string = "AAB"
    
    let ret = permuteStringAllowRepetitions(s: string)
    let retSet = Set<String>(ret)
    
    let expect = [
      "AAB",
      "ABA",
      "BAA",
    ]
    
    let expectSet = Set<String>(expect)
    
    XCTAssertEqual(retSet, expectSet)
  }
  
  // MARK: GenerateStringSubsets
  func testGenerateStringSubsets123() {
    let ret = generateAllStringSubsets(s: "123")
    
    let retSet = Set<String>(ret)
    let expectSet = Set<String>([
      "",
      "3",
      "2",
      "23",
      "1",
      "13",
      "12",
      "123",
    ])
    
    XCTAssertEqual(retSet, expectSet)
  }
  
   // MARK: GenerateIntSubsets
  func testGenerateAllintSubsets() {
    let input: [Int] = [1, 2, 3,]
    let ret = generateAllIntSubsets(arr: input)
    
    let expectedOutput = [
      [3],
      [1],
      [2],
      [1, 2, 3],
      [1, 3],
      [2, 3],
      [1, 2],
      []
    ]
    
    var retSet: Set<[Int]> = Set<[Int]>(ret)
    let expectedSet = Set<[Int]>(expectedOutput)
    
    XCTAssertEqual(retSet, expectedSet)
  }
  
// MARK: GenerateIntSubsetsAllowDuplicates
  func testGenerateIntSubsetsAllowDuplicates() {
    let input: [Int] = [1, 2, 2,]
    let ret = generateIntSubsetsAllowDuplicates(arr: input)
    
    let expectedOutput = [
      [2],
      [1],
      [1, 2, 2],
      [2, 2],
      [1, 2],
      []
    ]
    
    var retSet: Set<[Int]> = Set<[Int]>(ret)
    let expectedSet = Set<[Int]>(expectedOutput)
    
    XCTAssertEqual(retSet, expectedSet)
  }
  
  func testGenerateIntSubsetsAllowDuplicatesThreeTwos() {
    let input: [Int] = [2, 2, 2,]
    let ret = generateIntSubsetsAllowDuplicates(arr: input)
    
    let expectedOutput = [
      [2],
      [2, 2,],
      [2, 2, 2],
      [],
    ]
    
    var retSet: Set<[Int]> = Set<[Int]>(ret)
    let expectedSet = Set<[Int]>(expectedOutput)
    
    XCTAssertEqual(retSet, expectedSet)
  }
  
  func testGenerateIntSubsetsAllowDuplicatesTwoTwosTwoFours() {
    let input: [Int] = [2, 2, 4, 4]
    let ret = generateIntSubsetsAllowDuplicates(arr: input)
    
    let expectedOutput = [
      [4],
      [4, 4],
      [2],
      [2, 4],
      [2, 4, 4],
      [2, 2,],
      [2, 2, 4],
      [2, 2, 4, 4,],
      [],
    ]
    
    var retSet: Set<[Int]> = Set<[Int]>(ret)
    let expectedSet = Set<[Int]>(expectedOutput)
    
    XCTAssertEqual(retSet, expectedSet)
  }
  
  func testGenerateIntSubsetsAllowDuplicatesThreeTwosOneFour() {
    let input: [Int] = [2, 2, 2, 4]
    let ret = generateIntSubsetsAllowDuplicates(arr: input)
    
    let expectedOutput = [
      [4],
      [2, 4],
      [2],
      [2, 2,],
      [2, 2, 4],
      [2, 2, 2,],
      [2, 2, 2, 4],
      [],
    ]
    
    var retSet: Set<[Int]> = Set<[Int]>(ret)
    let expectedSet = Set<[Int]>(expectedOutput)
    
    XCTAssertEqual(retSet, expectedSet)
  }
  
  // MARK: Letter case Permutation
  // Given a string s, we can transform every letter individually to be lowercase or
  // uppercase to create another string.  Return a list of all possible strings we
  // could create.

  func testLetterCasePermutationExample1() {
    let s = "a1b2"
    let output: [String] = letter_case_permutation(s: s).sorted()
    let expected = [
      "a1b2",
      "a1B2",
      "A1b2",
      "A1B2",
    ].sorted()
    
    XCTAssertEqual(output, expected)
  }
  
  func testLetterCasePermutationExample2() {
    let s = "3z4"
    let output: [String] = letter_case_permutation(s: s)
    let expected = [
      "3z4",
      "3Z4",
    ]
    
    XCTAssertEqual(output.sorted(), expected.sorted())
  }

  func testLetterCasePermutationExample3() {
    let s = "12345"
    let output: [String] = letter_case_permutation(s: s)
    let expected = [
      "12345"
    ]
    
    XCTAssertEqual(output.sorted(), expected.sorted())
  }
  
  func testLetterCasePermutationExample() {
    let s = "A1B2C"
    let output: [String] = letter_case_permutation(s: s).sorted()
    let expected = [
      "a1b2c",
      "a1b2C",
      "a1B2c",
      "a1B2C",
      "A1b2c",
      "A1b2C",
      "A1B2c",
      "A1B2C",
    ].sorted()
    
    let outputSet = Set<String>(expected)
    XCTAssertEqual(outputSet.count, output.count)
    
    XCTAssertEqual(output, expected)
  }


  // MARK: Generate All Combinations With Sum Equal To Target

func testCombinationsSumToTargetExample1() {
    let arr: [Int] = [1, 2, 3,]
    let target: Int = 3
    
    let ret = generate_all_combinations(arr: arr, target: target)
    
    let retSet = Set<[Int]>(ret)
    
    let expected = [
      [3],
      [1, 2],
    ]
    let expectedSet = Set<[Int]>(expected)
    
    XCTAssertEqual(retSet, expectedSet)
  }
  
  func testCombinationsSumToTargetExample2() {
    let arr: [Int] = [1, 1, 1, 1]
    let target: Int = 2
    
    let ret = generate_all_combinations(arr: arr, target: target)
    
    let retSet = Set<[Int]>(ret)
    
    let expected = [
      [1, 1,],
    ]
    let expectedSet = Set<[Int]>(expected)
    
    XCTAssertEqual(retSet, expectedSet)
  }
  
  func testCombinationsSumFailingCase1() {
    let arr: [Int] = [42, 68, 35, 1, 70, 25, 79, 59, 63, 65, 6, 46, 82, 28, 62, 92, 96, 43, 28, 37, 92, 5, 3, 54, 93]
    let target: Int = 83
    
    let ret = generate_all_combinations(arr: arr, target: target)
    
    let retSet = Set<[Int]>(ret)
    
    let expected: [[Int]] = [
      [37, 46],
      [6, 35, 42],
      [5, 35, 43],
      [5, 6, 35, 37],
      [3, 37, 43],
      [3, 6, 28, 46],
      [1, 82],
      [1, 28, 54],
      [1, 5, 35, 42],
      [1, 5, 6, 28, 43],
      [1, 5, 6, 25, 46],
      [1, 3, 79],
      [1, 3, 37, 42],
      [1, 3, 25, 54],
      [1, 3, 5, 28, 46],
      [1, 3, 5, 6, 68],
      [1, 3, 5, 6, 25, 43]
    ]
    
    let expectedSet = Set<[Int]>(expected)
    
    XCTAssertEqual(expectedSet, retSet)
  }
  
  func testCombinationSumTooSlowCase1() {
    let arr: [Int] =  [94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94]
    let target: Int = 2256
    
    let start = Date()
    
    let ret = generate_all_combinations(arr: arr, target: target)
    
    let elapsed = Date().timeIntervalSince(start)
    print("\(elapsed) - elapsed time")
    
    if elapsed > 5 {
      XCTFail("TOO SLOW")
    }
    
    let retSet = Set<[Int]>(ret)
    
    let expected: [[Int]] = [
      [94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94]
    ]
    
    let expectedSet = Set<[Int]>(expected)
    
    XCTAssertEqual(expectedSet, retSet)
  }
  
  func testFailingTestCase2() {
    let arr: [Int] = [1, 2, 3, 3, 4, 5]
    let target = 6
    
    let ret = generate_all_combinations(arr: arr, target: target)
        
    let retSet = Set<[Int]>(ret)
    
    let expected: [[Int]] = [
      [3, 3],
      [2, 4, ],
      [1, 5,],
      [1, 2, 3,],
    ]
    
    let expectedSet = Set<[Int]>(expected)
    
    XCTAssertEqual(expectedSet, retSet)

  }
  
  func testFailingCase13() {
    let arr: [Int] =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
    let target = 300

    let start = Date()
    let ret = generate_all_combinations(arr: arr, target: target)
        
    let elapsed = Date().timeIntervalSince(start)
    print("\(elapsed) - elapsed time")
    
    if elapsed > 5 {
      XCTFail("TOO SLOW")
    }

    let retSet = Set<[Int]>(ret)
    
    let expected: [[Int]] = [
      [6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [5, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [5, 6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [4, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [4, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [4, 5, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [4, 5, 6, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [4, 5, 6, 7, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [4, 5, 6, 7, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25],
      [3, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 5, 6, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 5, 6, 7, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 6, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 5, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 5, 6, 7, 8, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 5, 6, 7, 8, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 23, 24, 25],
      [2, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 5, 6, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 6, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 5, 6, 7, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 5, 6, 7, 8, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25],
      [2, 3, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 5, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 5, 6, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 5, 6, 7, 8, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25],
      [2, 3, 4, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 6, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 6, 7, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 6, 7, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 7, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25],
      [1, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 5, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 6, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 5, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 5, 6, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 5, 6, 7, 8, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25],
      [1, 3, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 5, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 5, 6, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 5, 6, 7, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 5, 6, 7, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 6, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 6, 7, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 6, 7, 8, 9, 10, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25],
      [1, 2, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 5, 6, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 5, 6, 7, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 6, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 6, 7, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 5, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 5, 6, 7, 8, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 5, 6, 7, 8, 9, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 23, 24, 25],
      [1, 2, 3, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 6, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 5, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 5, 6, 7, 8, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25],
      [1, 2, 3, 4, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 6, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 6, 7, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 7, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 7, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
    ]
    
    let expectedSet = Set<[Int]>(expected)
    
    XCTAssertEqual(expectedSet, retSet)
  }
  
  // MARK: Utility  
  private func sortTestHelper(sort: (_ numbers: inout [Int]) -> ()) {
        
    numbers.forEach {
      let sortedCopy = $0.sorted()
      var mutable = $0
      sort(&mutable)
      compareNumbers(mutable, sortedCopy)
    }
  }
  
  private func compareNumbers(_ numbers: [Int], _ sortedCopy: [Int]) {
    for i in 0..<numbers.count {
      let numbersCandidate = numbers[i]
      let sortedCopyCandidate = sortedCopy[i]
      
      XCTAssertEqual(numbersCandidate, sortedCopyCandidate)
    }
  }
}

