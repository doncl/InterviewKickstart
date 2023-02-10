//
//  ReviewAllSortsV2.swift
//  ReviewAllSortsV2
//
//  Created by Don Clore on 2/9/23.
//
func selectionSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var smallestIndex = i
    for j in (i + 1)..<numbers.count {
      if numbers[j] < numbers[smallestIndex] {
        smallestIndex = j
      }
    }
    
    if smallestIndex != i {
      numbers.swapAt(smallestIndex, i)
    }
  }
}

func bubbleSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    for j in stride(from: numbers.count - 1, to: i, by: -1) {
      if numbers[j] < numbers[j - 1] {
        numbers.swapAt(j, j - 1)
      }
    }
  }
}

func insertionSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var red = i - 1
    let temp = numbers[i]
    
    while red >= 0 && numbers[red] > temp {
      numbers[red + 1] = numbers[red]
      red -= 1
    }
    numbers[red + 1] = temp
  }
}

func mergeSort(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    let midpoint = start + ((end - start) / 2)
    
    helper(start: start, end: midpoint)
    helper(start: midpoint + 1, end: end)
    
    var aux: [Int] = []
    
    var leftIdx = start
    var rightIdx = midpoint + 1
    
    while leftIdx <= midpoint && rightIdx <= end {
      if numbers[leftIdx] <= numbers[rightIdx] {
        aux.append(numbers[leftIdx])
        leftIdx += 1
      } else {
        aux.append(numbers[rightIdx])
        rightIdx += 1
      }
    }
    
    if leftIdx <= midpoint {
      for i in leftIdx...midpoint {
        aux.append(numbers[i])
      }
    } else if rightIdx <= end {
      for i in rightIdx...end {
        aux.append(numbers[i])
      }
    }
  
    let count = end - start + 1
    assert(aux.count == count)
    
    for i in 0..<aux.count {
      numbers[i + start] = aux[i]
    }
  }
  
  helper(start: 0, end: numbers.count - 1)
}

func quickSortLomuto(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }
    
    var smaller = start
    for bigger in (start + 1)...end {
      if numbers[bigger] < numbers[start] {
        smaller += 1
        numbers.swapAt(smaller, bigger)
      }
    }
    numbers.swapAt(start, smaller)
    
    helper(start: start, end: smaller - 1)
    helper(start: smaller + 1, end: end)
  }
  
  helper(start: 0, end: numbers.count - 1)
}

func quickSortHoare(numbers: inout [Int]) {
  func helper(start: Int, end: Int) {
    guard end > start else {
      return
    }

    let randomPivotIndex = Int.random(in: start...end)
    numbers.swapAt(start, randomPivotIndex)

    var red = start + 1
    var green = end
    
    while green >= red {
      if numbers[red] < numbers[start] {
        red += 1
      } else if numbers[green] > numbers[start] {
        green -= 1
      } else {
        numbers.swapAt(red, green)
        red += 1
        green -= 1
      }
    }
    numbers.swapAt(start, green)
    helper(start: start, end: green - 1)
    helper(start: green + 1, end: end)
  }
  
  helper(start: 0, end: numbers.count - 1)
}

func heapSort(numbers: inout [Int]) {
  func leftChildIndex(at index: Int) -> Int {
    2 * index + 1
  }
  
  func rightChildIndex(at index: Int) -> Int {
    2 * index + 2
  }
  
  func siftDown(at index: Int, upTo size: Int) {
    var parentIndex = index
    
    while true {
      var candidateIndex = parentIndex
      let leftChild = leftChildIndex(at: parentIndex)
      let rightChild = rightChildIndex(at: parentIndex)
      
      if leftChild < size && numbers[leftChild] > numbers[candidateIndex] {
        candidateIndex = leftChild
      }
      
      if rightChild < size && numbers[rightChild] > numbers[candidateIndex] {
        candidateIndex = rightChild
      }
      
      if candidateIndex == parentIndex {
        return
      }
      
      numbers.swapAt(candidateIndex, parentIndex)
      parentIndex = candidateIndex
    }
  }
  
  guard !numbers.isEmpty else {
    return
  }
  
  for i in stride(from: numbers.count / 2 - 1, through: 0, by: -1) {
    siftDown(at: i, upTo: numbers.count)
  }
  
  for i in stride(from: numbers.count - 1, through: 0, by: -1) {
    numbers.swapAt(i, 0)
    siftDown(at: 0, upTo: i)
  }
}
