//
//  BinaryTreeBFSV2.swift
//  BinaryTreeBFSV2
//
//  Created by Don Clore on 4/11/23.
//

final class BinaryTreeNode {
  var value: Int
  var left: BinaryTreeNode?
  var right: BinaryTreeNode?
  
  public init(value: Int) {
    self.value = value
  }
}

struct Q {
  var left: [BinaryTreeNode] = []
  var right: [BinaryTreeNode] = []
  
  var isEmpty: Bool {
    left.isEmpty && right.isEmpty
  }
  
  mutating func enQueue(_ node: BinaryTreeNode) {
    right.append(node)
  }
  
  mutating func deQueue() -> BinaryTreeNode? {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    return left.popLast()
  }
}

func level_order_traversal(root: BinaryTreeNode?) -> [[Int]] {
  var ret: [[Int]] = []
  
  guard let root else {
    return ret
  }
  
  var q = Q()
  q.enQueue(root)
  q.enQueue(BinaryTreeNode(value: Int.min))
  
  ret.append([root.value])
  
  var levelsArray: [Int] = []
  while !q.isEmpty {
    var node = q.deQueue()!
    if node.value == Int.min {
      if !levelsArray.isEmpty {
        ret.append(levelsArray)
        levelsArray.removeAll()
      }
      if q.isEmpty {
        return ret
      }
      node = q.deQueue()!
      q.enQueue(BinaryTreeNode(value: Int.min))
    }
    
    if let left = node.left {
      q.enQueue(left)
      levelsArray.append(left.value)
    }
    
    if let right = node.right {
      q.enQueue(right)
      levelsArray.append(right.value)
    }
  }  

  return ret 
}
