import XCTest
@testable import PermuteIntsWithoutReptitionV2

final class PermuteIntsWithoutRepetitionsTests: XCTestCase {
  func test123() {
    let array = [1, 2, 3,]
    
    let ret = get_permutations(arr: array)
    
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
}


