//
//  MergeKSortedLinkedLists.swift
//  MergeKSortedLinkedLists
//
//  Created by Don Clore on 2/18/23.
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

final class NodeWithIndex {
  let index: Int
  let node: LinkedListNode
  
  public init(index: Int, node: LinkedListNode) {
    self.index = index
    self.node = node
  }
}

extension NodeWithIndex: Equatable {
  static func == (lhs: NodeWithIndex, rhs: NodeWithIndex) -> Bool {
    lhs.node == rhs.node
  }
}

extension NodeWithIndex: Comparable {
  static func < (lhs: NodeWithIndex, rhs: NodeWithIndex) -> Bool {
    lhs.node < rhs.node
  }
}


func merge_k_lists(lists: [LinkedListNode?]) -> LinkedListNode? {
  var arr = lists.compactMap { $0 }
  guard !arr.isEmpty else {
      return nil
  }

  var heap = Heap<NodeWithIndex>(elements: [], sort: { lhs, rhs in
    let lValue = lhs.node.value
    let rValue = rhs.node.value
    return lValue <= rValue
  })
  for i in 0..<arr.count {
    let list = arr[i]
    var temp: LinkedListNode? = list
    while temp != nil {
      let nodeWithIndex = NodeWithIndex(index: i, node: temp!)
      heap.insert(nodeWithIndex)
      let next = temp!.next
      temp!.next = nil
      temp = next
    }
  }

  var head: LinkedListNode?
  guard let lln = heap.remove(at: 0) else {
    return nil
  }
  
  let value = lln.node.value
  print(value)
  
  head = lln.node
  var temp = head
  while temp != nil {
    let next = heap.remove(at: 0)
    guard let next else {
      break
    }
    let value = next.node.value
    print(value)

    let nextNode = next.node
    temp!.next = nextNode
    temp = nextNode
  }
  return head
}
