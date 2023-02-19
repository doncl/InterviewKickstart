//
//  MergeKSortedLinkedListsV3.swift
//  MergeKSortedLinkedListsV3
//
//  Created by Don Clore on 2/19/23.
//

final class LinkedListNode {
    var value: Int
    var next: LinkedListNode?

    public init(value: Int) {
        self.value = value
    }
}

extension LinkedListNode: Equatable {
  static func == (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
    lhs.value == rhs.value
  }
}

extension LinkedListNode: Comparable {
  static func < (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
    lhs.value < rhs.value
  }
}


func merge_k_lists(lists: [LinkedListNode?]) -> LinkedListNode? {
  var arr = lists
  guard !arr.isEmpty else {
      return nil
  }

  var heap = Heap<LinkedListNode>(elements: [], sort: { lhs, rhs in
    let lValue = lhs.value
    let rValue = rhs.value
    return lValue <= rValue
  })
  
  for i in 0..<arr.count {
    let listHead = arr[i]
    var temp: LinkedListNode? = listHead
    while temp != nil {
      heap.insert(temp!)
      let next = temp!.next
      temp!.next = nil
      temp = next
    }
    arr[i] = nil  // has been inserted into heap
  }

  var head: LinkedListNode?
  guard let lln = heap.remove(at: 0) else {
    return nil
  }
   
  head = lln
  var temp = head
  while temp != nil {
    let next = heap.remove(at: 0)
    guard let next else {
      break
    }
    temp!.next = next
    temp = next
  }
  return head
}
