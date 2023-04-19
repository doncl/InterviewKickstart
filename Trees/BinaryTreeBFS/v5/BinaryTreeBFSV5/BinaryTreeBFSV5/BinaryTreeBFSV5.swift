//
//  BinaryTreeBFSV5.swift
//  BinaryTreeBFSV5
//
//  Created by Don Clore on 4/19/23.
//

final class BinaryTreeNode {
  var value: Int
  var left: BinaryTreeNode?
  var right: BinaryTreeNode?
  
  public init(value: Int) {
    self.value = value
  }
}

struct Q<T> {
  var left: [T] = []
  var right: [T] = []
  
  var isEmpty: Bool {
    left.isEmpty && right.isEmpty
  }
  
  mutating func enQueue(_ t: T) {
    right.append(t)
  }
  
  mutating func deQueue() -> T? {
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
  
  var q = Q<BinaryTreeNode>()
  
  q.enQueue(root)
  ret.append([root.value])
  
  q.enQueue(BinaryTreeNode(value: Int.min))
  
  var levelArray: [Int] = []
  
  while !q.isEmpty {
    var node = q.deQueue()!
    if node.value == Int.min {
      if !levelArray.isEmpty {
        ret.append(levelArray)
        levelArray.removeAll()
      }
      if q.isEmpty {
        return ret
      }
      node = q.deQueue()!
      q.enQueue(BinaryTreeNode(value: Int.min))
    }
    
    if let left = node.left {
      q.enQueue(left)
      levelArray.append(left.value)
    }
    
    if let right = node.right {
      q.enQueue(right)
      levelArray.append(right.value)
    }
  }

  return ret 
}
