//
//  ReviewAllRecursionProblemsV1Tests.swift
//  ReviewAllRecursionProblemsV1Tests
//
//  Created by Don Clore on 3/8/23.
//


import XCTest
@testable import ReviewAllRecursionProblemsV1

final class ReviewAllRecursionProblemsV1Tests: XCTestCase {
  // MARK: Fibonacci
  
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
    
    let resultSet = Set<Int>(result[0])
    let expectedSet = Set<Int>([1, 2, 3, 4, 5, 6])
    
    XCTAssertEqual(resultSet, expectedSet)
  }
  
  func testNChooseK2NumExample() {
    let result = find_combinations(n: 2, k: 2)
    XCTAssertEqual(result.count, 1)
    
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
    
    let expect = [
      [1,2,3,],
      [1,3,2,],
      [2,1,3,],
      [2,3,1,],
      [3,1,2,],
      [3,2,1,],
    ]
      
    XCTAssertEqual(expect, ret)
  }
  
  // MARK: PermuteStringWithoutRepetition
  func testABC() {
    let string = "ABC"
    
    let ret = permuteStringWithoutRepetition(s: string)
    
    let expect = [
      "ABC",
      "ACB",
      "BAC",
      "BCA",
      "CAB",
      "CBA",
      ]
      
      XCTAssertEqual(expect, ret)
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

}



