//
//  ReviewAllSorts.swift
//  ReviewAllSorts
//
//  Created by Don Clore on 2/9/23.
//


func selectionSort(numbers: inout [Int]) {
  for i in 0..<numbers.count {
    var smallestIndex: Int = i
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
    
    var leftStart = start
    var rightStart = midpoint + 1
    
    while leftStart <= midpoint && rightStart <= end {
      if numbers[leftStart] <= numbers[rightStart] {
        aux.append(numbers[leftStart])
        leftStart += 1
      } else {
        aux.append(numbers[rightStart])
        rightStart += 1
      }
    }
    
    if leftStart <= midpoint {
      for i in leftStart...midpoint {
        aux.append(numbers[i])
      }
    } else if rightStart <= end {
      for i in rightStart...end {
        aux.append(numbers[i])
      }
    }
    
    let size = end - start + 1
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
    
    let midpoint = Int.random(in: start...end)
    numbers.swapAt(start, midpoint)
    
    var smaller = start
    for bigger in (start + 1)...end {
      if numbers[bigger] < numbers[start] {
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

    let midpoint = Int.random(in: start...end)
    numbers.swapAt(start, midpoint)

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
  func leftChildIndex(ofParentAt index: Int) -> Int {
    2 * index + 1
  }
  
  func rightChildIndex(ofParentAt index: Int) -> Int {
    2 * index + 2
  }
  
  func siftDown(from index: Int, upTo size: Int) {
    var parentIndex = index
    
    while true {
      // index for left and right child
      let leftChildIndex = leftChildIndex(ofParentAt: parentIndex)
      let rightChildIndex = rightChildIndex(ofParentAt: parentIndex)
      
      // set temp var to parent
      var candidateIndex = parentIndex
      
      // We check children to see if they're bigger, we only check left and right
      // once each per iteration, if left is bigger, candidate becomes left, and
      // we'll then check the right child of the candidate.  This works because on
      // the next iteration we'll check the leftIndex of the candidate.
      
      // check and see if the left child is bigger
      if leftChildIndex < size && numbers[leftChildIndex] > numbers[candidateIndex] {
        candidateIndex = leftChildIndex
      }
      
      // now check the right child of whatever we're pointing at now.
      if rightChildIndex < size && numbers[rightChildIndex] > numbers[candidateIndex] {
        candidateIndex = rightChildIndex
      }
      
      // If we didn't move at all, after that, then the heap constraint holds true, we're done.
      if candidateIndex == parentIndex {
        return
      }
      
      // swap the candidate with the parent, so the parent is now in its bubble-down place
      numbers.swapAt(parentIndex, candidateIndex)
      
      // now start at the candidate (where the parent was swapped to), and keep looking).
      parentIndex = candidateIndex
    }
  }
  
  if !numbers.isEmpty {
    for i in stride(from: numbers.count / 2 - 1, through: 0, by: -1) {
      siftDown(from: i, upTo: numbers.count)
    }
    
    for index in numbers.indices.reversed() {
      numbers.swapAt(0, index)
      siftDown(from: 0, upTo: index)
    }
  }
}
