//
//  MergeKSortedLinkedListsV2.swift
//  MergeKSortedLinkedListsV2
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

//extension LinkedListNode: Equatable {
//  static func == (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
//    lhs.value == rhs.value
//  }
//}
//
//extension LinkedListNode: Comparable {
//  static func < (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
//    lhs.value < rhs.value
//  }
//}

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
    lhs.node.value == rhs.node.value
  }
}

extension NodeWithIndex: Comparable {
  static func < (lhs: NodeWithIndex, rhs: NodeWithIndex) -> Bool {
    lhs.node.value < rhs.node.value
  }
}


func merge_k_lists(lists: [LinkedListNode?]) -> LinkedListNode? {
  var arr = lists

  var heap = Heap<NodeWithIndex>(elements: [], sort: { lhs, rhs in
    let lValue = lhs.node.value
    let rValue = rhs.node.value
    return lValue < rValue
  })

  var head: LinkedListNode?
  var curr: LinkedListNode?
  
  func drain() {
    while let minNode = heap.remove(at: 0) {
      print("minnode = \(minNode.node.value)")
      if head == nil {
        head = minNode.node
        curr = head
      } else {
        curr!.next = minNode.node
        curr = curr!.next
      }
    }
  }
  
  while true {
    var foundNonNil = false
    
    for i in 0..<arr.count {
      if let headOfIthList = arr[i] {
        foundNonNil = true
        let nodeWithIndex = NodeWithIndex(index: i, node: headOfIthList)
        heap.insert(nodeWithIndex)
        arr[i] = headOfIthList.next
      }
    }
    
    drain()
    guard foundNonNil else {
      break
    }
  }
    
  return head
}

