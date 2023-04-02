//
//  BinaryTreeBFS.swift
//  BinaryTreeBFS
//
//  Created by Don Clore on 3/31/23.
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
    
    mutating func add(_ node: BinaryTreeNode) {
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
  guard let root = root else {
      return ret
  }
  
  var q = Q()
  q.add(root)
  q.add(BinaryTreeNode(value: Int.min))
  ret.append([root.value])

  var levelArray: [Int] = []
  var level = 0
  while !q.isEmpty {
    var node = q.deQueue()!
    if node.value == Int.min {
      if !levelArray.isEmpty {
        ret.append(levelArray)
      }
      levelArray = []
      level += 1
      if q.isEmpty {
        break
      }
      assert(!q.isEmpty)
      node = q.deQueue()!
      q.add(BinaryTreeNode(value: Int.min))
    }
    
    print("level \(level), value = \(node.value)")
    if let left = node.left {
      q.add(left)
      levelArray.append(left.value)
    }
    if let right = node.right {
      q.add(right)
      levelArray.append(right.value)
    }

  }
    
  return ret
}

