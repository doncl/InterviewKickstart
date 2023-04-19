

import XCTest
@testable import BinaryTreeBFSV5

final class BinaryTreeBFSTest: XCTestCase {
  func testFailingExample001() {
    let two = BinaryTreeNode(value: 2)
    let five = BinaryTreeNode(value: 5)
    let four = BinaryTreeNode(value: 4)
    let zero = BinaryTreeNode(value: 0)
    let one = BinaryTreeNode(value: 1)
    let three = BinaryTreeNode(value: 3)
    let six = BinaryTreeNode(value: 6)
    
    two.left = five
    two.right = four
    five.left = zero
    five.right = one
    
    four.left = three
    four.right = six
    
    let ret = level_order_traversal(root: two)
    
    let expected: [[Int]] = [
      [2],
      [5, 4],
      [0, 1, 3, 6],
    ]
    
    XCTAssertEqual(ret, expected)
  }
  
  func testFailingExample000() {
    let zero = BinaryTreeNode(value: 0)
    let one = BinaryTreeNode(value: 1)
    let two = BinaryTreeNode(value: 2)
    let four = BinaryTreeNode(value: 4)
    let three = BinaryTreeNode(value: 3)

    zero.left = one
    one.right = two
    two.left = four
    four.right = three
    
    
    let ret = level_order_traversal(root: zero)
    
    let expected: [[Int]] = [
      [0],
      [1],
      [2],
      [4],
      [3],
    ]
    
    XCTAssertEqual(ret, expected)
  }
}

