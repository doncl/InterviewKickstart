//
//  MergeKSortedLinkedListsTests.swift
//  MergeKSortedLinkedListsTests
//
//  Created by Don Clore on 2/18/23.
//

/*
 {
 "lists": [
 [1, 3, 5],
 [3, 4],
 [7]
 ]
 }
 
 [1, 3, 3, 4, 5, 7]
 */

import XCTest
@testable import MergeKSortedLinkedLists

final class MergeKSortedLinkedListsTests: XCTestCase {
  func testExampleOne() {
    var one = LinkedListNode(value: 1)
    var three = LinkedListNode(value: 3)
    var five = LinkedListNode(value: 5)
    
    var threeSecond = LinkedListNode(value: 3)
    var four = LinkedListNode(value: 4)
    
    var seven = LinkedListNode(value: 7)
    
    let list1 = one
    one.next = three
    three.next = five
    five.next = nil
    
    let list2 = threeSecond
    threeSecond.next = four
    four.next = nil
    
    let list3 = seven
    seven.next = nil
    
    let lists = [list1, list2, list3]
    

    let ret = merge_k_lists(lists: lists)
    var expected: [Int] = []
    var temp = ret
    while temp != nil {
      expected.append(temp!.value)
      temp = temp!.next
    }
    
    XCTAssertEqual(expected, [1, 3, 3, 4, 5, 7])
  }
  
  func testFirstFailingCase() {
    // [1, 3, 5, 7, 8]

    let one = LinkedListNode(value: 1)
    let three = LinkedListNode(value: 3)
    let five = LinkedListNode(value: 5)
    let seven = LinkedListNode(value: 7)
    let eight = LinkedListNode(value: 8)
    
    let list = one
    one.next = three
    three.next = five
    five.next = seven
    seven.next = eight
        
    let ret = merge_k_lists(lists: [list])
    
    var expected: [Int] = []
    var temp = ret
    while temp != nil {
      expected.append(temp!.value)
      temp = temp!.next
    }
    
    XCTAssertEqual(expected, [1, 3, 5, 7, 8,])

  }
  
  func testSecondFailingCase() {
    /*
     {
     "lists": [
     [1, 1, 1, 1, 1],
     [2, 2, 2, 2, 2],
     [3, 3, 3, 3, 3],
     [4, 4, 4, 4, 4]
     ]
     }
     */
    
    /*
     expected: [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4]
     */
    
    let list1 = LinkedListNode(value: 1)
    let list2 = LinkedListNode(value: 2)
    let list3 = LinkedListNode(value: 3)
    let list4 = LinkedListNode(value: 4)

    var temp1 = list1
    var temp2 = list2
    var temp3 = list3
    var temp4 = list4
    for _ in 0..<4 {
      temp1.next = LinkedListNode(value: 1)
      temp2.next = LinkedListNode(value: 2)
      temp3.next = LinkedListNode(value: 3)
      temp4.next = LinkedListNode(value: 4)
      
      temp1 = temp1.next!
      temp2 = temp2.next!
      temp3 = temp3.next!
      temp4 = temp4.next!
    }
    
    let lists = [list1, list2, list3, list4,]
//    let lists = [list4,]
   
    let ret = merge_k_lists(lists: lists)
    
    var expected: [Int] = []
    var temp = ret
    while temp != nil {
      expected.append(temp!.value)
      temp = temp!.next
    }
    
    XCTAssertEqual(expected, [1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4])


  }
}
