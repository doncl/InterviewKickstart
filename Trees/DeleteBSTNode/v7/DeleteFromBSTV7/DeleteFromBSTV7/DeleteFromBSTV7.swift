//
//  DeleteFromBSTV7.swift
//  DeleteFromBSTV7
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

func delete_from_bst(root: BinaryTreeNode?, values_to_be_deleted: [Int]) -> BinaryTreeNode? {
  var ret = root
    
  func getSuccessor(forNode node: BinaryTreeNode) -> BinaryTreeNode {
    assert(node.left != nil && node.right != nil)
    
    var prev = node
    var curr = node.right!
    
    while curr.left != nil {
      prev = curr
      curr = node.left!
    }
    
    if curr.value < prev.value {
      prev.left = curr.right
    } else {
      prev.right = curr.right
    }
    return curr
  }
  
  func search(from node: BinaryTreeNode?, for value: Int) -> (nodeToDelete: BinaryTreeNode, parent: BinaryTreeNode?)? {
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
    
  func deleteFromBST(root: BinaryTreeNode?, value: Int) -> BinaryTreeNode? {
    guard let tuple = search(from: root, for: value) else {
      return root
    }
    
    let nodeToDelete: BinaryTreeNode = tuple.nodeToDelete
    let parent: BinaryTreeNode? = tuple.parent
    
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
    let successor = getSuccessor(forNode: nodeToDelete)
    nodeToDelete.value = successor.value
    
    return root
  }
  
  for value in values_to_be_deleted {
    ret = deleteFromBST(root: ret, value: value)
  }
  
  return ret
}

