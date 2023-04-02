//
//  DeleteFromBST.swift
//  DeleteFromBST
//
//  Created by Don Clore on 4/2/23.
//

final class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    public init(value: Int) {
        self.value = value
    }
}

func search(forValue value: Int, fromNode node: BinaryTreeNode) -> (node: BinaryTreeNode, parent: BinaryTreeNode?)? {
  var prev: BinaryTreeNode? = nil
  var curr: BinaryTreeNode? = node
  
  guard node.value != value else {
    return (node: node, parent: nil)
  }
  
  while curr != nil {
    if value == curr!.value {
      return (node: curr!, parent: prev)
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
  guard let root = root else {
    return nil
  }
  guard let tuple = search(forValue: value, fromNode: root) else {
    return root
  }
  
  let nodeToDelete = tuple.node
  let parent = tuple.parent
  
  // CASE 1
  if nodeToDelete.left == nil && nodeToDelete.right == nil  {
    if parent == nil {
      return nil
    }
    if nodeToDelete.value < parent!.value {
      parent!.left = nil
    } else {
      parent!.right = nil
    }
    return root
  }
  
  // CASE2
  var child: BinaryTreeNode?
  if nodeToDelete.left != nil && nodeToDelete.right == nil {
    child = nodeToDelete.left
  } else if nodeToDelete.left == nil && nodeToDelete.right != nil {
    child = nodeToDelete.right
  }
  if let child = child {
    if parent == nil {
      return child
    }
    
    if nodeToDelete.value < parent!.value {
      parent!.left = child
    } else {
      parent!.right = child
    }
    return root
  }
  
  // CASE 3
  assert(nodeToDelete.left != nil && nodeToDelete.right != nil)
  
  if let successor = getSuccessor(forNode: nodeToDelete) {
    nodeToDelete.value = successor.value
  }
  
  return root
}

func getSuccessor(forNode node: BinaryTreeNode) -> BinaryTreeNode? {
  var prev = node
  var curr = node.right
  if curr == nil {
    return nil
  }
  while curr?.left != nil {
    prev = curr!
    curr = curr?.left
  }
  
  if curr!.value < prev.value {
      prev.left = curr!.right
  } else {
      prev.right = curr!.right
  }
  
  return curr
}


func delete_from_bst(root: BinaryTreeNode?, values_to_be_deleted: [Int]) -> BinaryTreeNode? {
  var ret = root
  for value in values_to_be_deleted {
    ret = deleteFromBST(root: ret, value: value)
  }
  
  return ret
}
