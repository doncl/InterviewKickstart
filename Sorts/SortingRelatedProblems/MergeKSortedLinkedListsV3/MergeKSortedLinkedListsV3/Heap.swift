//
//  Heap.swift
//  MergeKSortedLinkedLists
//
//  Created by Don Clore on 2/18/23.
//

import Foundation

struct Heap<Element: Equatable> {
  var elements: [Element]
  
  let sort: (Element, Element) -> Bool
  
  init(elements: [Element], sort: @escaping (Element, Element) -> Bool) {
    self.elements = elements
    self.sort = sort
    
    buildHeap()
  }
  
  mutating func buildHeap() {
    for i in stride(from: elements.count - 1, through: 0, by: -1) {
      siftDown(from: i, upTo: elements.count)
    }
  }
  
  mutating func merge(heap: Heap) {
    elements = elements + heap.elements
    buildHeap()
  }
    
  func getLeftChildIndex(fromParentIndex index: Int) -> Int {
    index * 2 + 1
  }
  
  func getRightChildIndex(fromParentIndex index: Int) -> Int {
    index * 2 + 2
  }
  
  func getParentIndex(ofChildAt index: Int) -> Int {
    (index - 1) / 2
  }
  
  mutating func siftDown(from index: Int, upTo size: Int) {
    var parentIndex = index
    
    while true {
      let leftChild = getLeftChildIndex(fromParentIndex: parentIndex)
      let rightChild = getRightChildIndex(fromParentIndex: parentIndex)
      
      var candidateIndex = parentIndex
      
      if leftChild < size && sort(elements[leftChild], elements[candidateIndex]) {
        candidateIndex = leftChild
      }
      
      if rightChild < size && sort(elements[rightChild], elements[candidateIndex]) {
        candidateIndex = rightChild
      }
      
      guard candidateIndex != parentIndex else {
        return
      }
      
      elements.swapAt(candidateIndex, parentIndex)
      parentIndex = candidateIndex
    }
  }
  
  mutating func siftUp(from index: Int) {
    var child = index
    var parent = getParentIndex(ofChildAt: child)
    while child > 0 && sort(elements[child], elements[parent]) {
      elements.swapAt(child, parent)
      child = parent
      parent = getParentIndex(ofChildAt: child)
    }
  }
  
  mutating func insert(_ element: Element) {
    elements.append(element)
    siftUp(from: elements.count - 1)
  }
    
  
  mutating func remove(at index: Int) -> Element? {
    guard index < elements.count else {
      return nil
    }
    
    if index == elements.count - 1 {
      return elements.removeLast()
    } else {
      elements.swapAt(index, elements.count - 1)
      defer {
        siftDown(from: index, upTo: elements.count)
        siftUp(from: index)
        print(elements.map{ ($0 as! LinkedListNode).value })
      }
      return elements.removeLast()
    }
  }
}

