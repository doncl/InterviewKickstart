//
//  ReviewAllSortsV3.swift
//  ReviewAllSortsV3
//
//  Created by Don Clore on 2/10/23.
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
      if numbers[j - 1] > numbers[j] {
        numbers.swapAt(j - 1, j)
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
    
    let midPointIdx = start + ((end - start) / 2)
    
    helper(start: start, end: midPointIdx)
    helper(start: midPointIdx + 1, end: end)
    
    var aux: [Int] = []
    
    var leftIdx = start
    var rightIdx = midPointIdx + 1
    
    while leftIdx <= midPointIdx && rightIdx <= end {
      
      let leftNum = numbers[leftIdx]
      let rightNum = numbers[rightIdx]
      
      if leftNum <= rightNum {
        aux.append(leftNum)
        leftIdx += 1
      } else {
        aux.append(rightNum)
        rightIdx += 1
      }
    }
    
    if leftIdx <= midPointIdx {
      for i in leftIdx...midPointIdx {
        aux.append(numbers[i])
      }
    } else if rightIdx <= end {
      for i in rightIdx...end {
        aux.append(numbers[i])
      }
    }
    
    let size = (end - start) + 1
    assert(aux.count == size)
    
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
    
    let randomIdx = Int.random(in: start...end)
    numbers.swapAt(randomIdx, start)
    
    var smaller = start
    for bigger in (start + 1)...end {
      if numbers[bigger] < numbers[smaller] {
        smaller += 1
        numbers.swapAt(bigger, smaller)
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
    
    let randomIdx = Int.random(in: start...end)
    numbers.swapAt(randomIdx, start)
        
    var red = start + 1
    var green = end
    
    while green >= red {
      if numbers[red] <= numbers[start] {
        red += 1
      } else if numbers[green] > numbers[start] {
        green -= 1
      } else {
        numbers.swapAt(green, red)
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
  func getLeftChildIdx(forParentIndex index: Int) -> Int {
    index * 2 + 1
  }
  
  func getRightChildIdx(forParentIndex index: Int) -> Int {
    index * 2 + 2
  }
  
  func siftDown(atIndex index: Int, upTo size: Int) {
    var parentIndex = index
    
    while true {
      let leftChild = getLeftChildIdx(forParentIndex: index)
      let rightChild = getRightChildIdx(forParentIndex: index)
      
      var candidateIndex = parentIndex
      
      if leftChild < size && numbers[leftChild] > numbers[candidateIndex] {
        candidateIndex = leftChild
      }
      
      if rightChild < size && numbers[rightChild] > numbers[candidateIndex] {
        candidateIndex = rightChild
      }
      
      guard candidateIndex != parentIndex else {
        return
      }
      
      numbers.swapAt(parentIndex, candidateIndex)
      parentIndex = candidateIndex
    }
  }
  
  for i in stride(from: numbers.count / 2 + 1, through: 0, by: -1) {
    siftDown(atIndex: i, upTo: numbers.count)
  }
  
  for i in stride(from: numbers.count - 1, through: 0, by: -1) {
    numbers.swapAt(i, 0)
    siftDown(atIndex: 0, upTo: i)
  }
}
