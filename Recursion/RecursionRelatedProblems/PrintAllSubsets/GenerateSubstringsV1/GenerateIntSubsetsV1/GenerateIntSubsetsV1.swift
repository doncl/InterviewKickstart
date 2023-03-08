//
//  GenerateIntSubsetsV1.swift
//  GenerateIntSubsetsV1
//
//  Created by Don Clore on 3/7/23.
//


func generate_all_subsets(s: String) -> [String] {
    var ret: [String] = []
    
    func helper(build: String, bank: String) {
        if bank.count == 0 {
            ret.append(build)
            return
        }
        
        let oneFromZero: String.Index = bank.index(bank.startIndex, offsetBy: 1)
        let stringWithFirstCharExcluded: String = String(bank[oneFromZero...])
        let stringOfFirstChar: String = String(bank[bank.startIndex..<oneFromZero])
        
        // exclude
        helper(build: build, bank: stringWithFirstCharExcluded)
        
        // include
        var newBuild = build
        newBuild.append(stringOfFirstChar)
        helper(build: newBuild, bank: stringWithFirstCharExcluded)
    }
    
    let build: String = ""
    let bank = s
    helper(build: build, bank: bank)
    
    return ret
}
