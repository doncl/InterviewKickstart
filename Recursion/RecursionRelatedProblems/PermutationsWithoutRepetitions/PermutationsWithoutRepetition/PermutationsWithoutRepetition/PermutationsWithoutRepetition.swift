//
//  PermutationsWithoutRepetition.swift
//  PermutationsWithoutRepetition
//
//  Created by Don Clore on 3/6/23.
//

  func permute(s: String) -> [String] {
    var ret: [String] = []
    
    func helper(build: inout String, bank: inout String) {
      guard build.count < s.count else {
        ret.append(build)
        return 
      }
      for i in 0..<bank.count {
        let index = bank.index(bank.startIndex, offsetBy: i)
        let charString = bank[index]
        bank.remove(at: index)
        build.append(charString)
        helper(build: &build, bank: &bank)
        _ = build.popLast()
        bank.insert(charString, at: index)
      }
    }
    
    var build = ""
    var bank = s
    helper(build: &build, bank: &bank)
    
    return ret
  }
