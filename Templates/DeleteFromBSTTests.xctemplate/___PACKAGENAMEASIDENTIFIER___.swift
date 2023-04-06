

import XCTest
@testable import ___FILEBASENAME___

final class DeleteFromBSTTests: XCTestCase {
func testExample1() {
    let four = BinaryTreeNode(value: 4)
    let two = BinaryTreeNode(value: 2)
    let six = BinaryTreeNode(value: 6)
    let one = BinaryTreeNode(value: 1)
    let three = BinaryTreeNode(value: 3)
    let five = BinaryTreeNode(value: 5)
    let seven = BinaryTreeNode(value: 7)
    
    four.left = two
    four.right = six
    
    two.left = one
    two.right = three
    
    six.left = five
    six.right = seven
    
    let valuesToBeDeleted: [Int] = [5, 6]
    
    let root = delete_from_bst(root: four, values_to_be_deleted: valuesToBeDeleted)
    
    XCTAssertNotNil(root)
    guard let root = root else {
      return
    }
    XCTAssertEqual(root.value, 4)
    
    XCTAssertNotNil(root.left)
    let leftChild = root.left!
    
    XCTAssertEqual(leftChild.value, 2)
                          
    XCTAssertNotNil(root.right)
    let rightChild = root.right!
    XCTAssertEqual(rightChild.value, 7)
    
    XCTAssertNotNil(leftChild.left)
    let leftGrandChild = leftChild.left!
    
    XCTAssertEqual(leftGrandChild.value, 1)
    
    XCTAssertNotNil(leftChild.right)
    let rightGranchild = leftChild.right!
    XCTAssertEqual(rightGranchild.value, 3)
    
    XCTAssertNil(rightGranchild.left)
    XCTAssertNil(rightGranchild.right)
    
    XCTAssertNil(root.right?.left)
    XCTAssertNil(root.right?.right)
  }
  
  func testCase2() {
    let ten = BinaryTreeNode(value: 10)
    let three = BinaryTreeNode(value: 3)
    let eleven = BinaryTreeNode(value: 11)
    let minusOne = BinaryTreeNode(value: -1)
    let five = BinaryTreeNode(value: 5)
    
    ten.left = three
    ten.right = eleven
    
    three.left = minusOne
    three.right = five
    
    let valuesToBeDelete: [Int] = [3, 6, 9]
    
    let root = delete_from_bst(root: ten, values_to_be_deleted: valuesToBeDelete)!
    
    XCTAssertEqual(root.value, 10)
    
    XCTAssertNotNil(root.left)
    let leftChild = root.left!
    XCTAssertEqual(leftChild.value, 5)
    
    
    XCTAssertNotNil(root.right)
    let rightChild = root.right!
    XCTAssertEqual(rightChild.value, 11)
    
    XCTAssertNotNil(leftChild.left)
    let leftGrandChild = leftChild.left!
    XCTAssertEqual(leftGrandChild.value, -1)
  }
  
  func testCase008() {
    let five = BinaryTreeNode(value: 5)
    let six = BinaryTreeNode(value: 6)
    let seven = BinaryTreeNode(value: 7)
    let eight = BinaryTreeNode(value: 8)
    let ten = BinaryTreeNode(value: 10)
    
    five.right = six
    six.right = seven
    seven.right = eight
    eight.right = ten
    
    let valuesToDelete: [Int] = [5, 6, 7, 8, 10]
    
    let nullTree = delete_from_bst(root: five, values_to_be_deleted: valuesToDelete)
    XCTAssertNil(nullTree)
  }
}

