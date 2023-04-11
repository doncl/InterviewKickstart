//
//  DeleteFromBSTV4.swift
//  DeleteFromBSTV4
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

func delete_from_bst(root: BinaryTreeNode?, values_to_be_deleted: [Int]) -> BinaryTreeNode? {
  var ret = root
    
  func search(fromNode node: BinaryTreeNode?, forValue value: Int) -> (nodeToDelete: BinaryTreeNode, parent: BinaryTreeNode?)? {
    guard let node else {
      return nil
    }
    var prev: BinaryTreeNode? = nil
    var curr: BinaryTreeNode? = node
    
    while curr != nil {
      if value == curr!.value {
        return (nodeToDelete: curr!, parent: prev)
      } else if value < curr!.value {
        prev = curr
        curr = curr!.left
      } else {
        prev = curr
        curr = curr!.right
      }
    }
    return nil
  }
  
  func findSuccessor(forNode node: BinaryTreeNode) -> BinaryTreeNode {
    assert(node.left != nil && node.right != nil)
    guard let right = node.right else {
      fatalError("Should not happen")
    }
    var curr = right
    var prev = node
    
    while curr.left != nil {
      prev = curr
      curr = curr.left!
    }
    
    let successor = curr
    if successor.value < prev.value {
      prev.left = successor.right
    } else {
      prev.right = successor.right
    }
    
    return successor
  }
  
  func deleteFromBST(root: BinaryTreeNode?, value: Int) -> BinaryTreeNode? {
    guard let root else {
      return nil
    }
    
    guard let nodeToDeleteTuple = search(fromNode: root, forValue: value) else {
      return root
    }
    
    let nodeToDelete: BinaryTreeNode = nodeToDeleteTuple.nodeToDelete
    let parent: BinaryTreeNode? = nodeToDeleteTuple.parent
    
    // CASE 1
    if nodeToDelete.left == nil && nodeToDelete.right == nil {
      guard let parent else {
        return nil
      }
      if nodeToDelete.value < parent.value {
        parent.left = nil
      } else {
        parent.right = nil
      }
      return root
    }
    
    // CASE 2
    var child: BinaryTreeNode? = nil
    if nodeToDelete.left != nil && nodeToDelete.right == nil {
      child = nodeToDelete.left
    } else if nodeToDelete.left == nil && nodeToDelete.right != nil {
      child = nodeToDelete.right
    }
    
    if let child {
      guard let parent else {
        return child
      }
        
      if nodeToDelete.value < parent.value {
        parent.left = child
      } else {
        parent.right = child
      }
      return root
    }
    
    // CASE 3
    assert(nodeToDelete.left != nil && nodeToDelete.right != nil)
    let successor = findSuccessor(forNode: nodeToDelete)
    nodeToDelete.value = successor.value
    
    return root
  }
  
  for value in values_to_be_deleted {
    ret = deleteFromBST(root: ret, value: value)
  }
  
  return ret
}
