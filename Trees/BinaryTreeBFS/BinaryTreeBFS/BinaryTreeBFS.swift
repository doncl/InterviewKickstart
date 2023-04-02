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
  return ret
}

