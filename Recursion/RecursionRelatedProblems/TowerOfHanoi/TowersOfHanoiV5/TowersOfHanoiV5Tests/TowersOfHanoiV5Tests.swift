import XCTest
@testable import TowersOfHanoiV5

final class TowersOfHanoiV5Tests: XCTestCase {
  func testExample() {
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
  
  func testExample2() {
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
}

