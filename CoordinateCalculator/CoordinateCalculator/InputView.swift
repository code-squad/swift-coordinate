//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 9..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    let validCharacter = CharacterSet.init(charactersIn: "(),-").union(CharacterSet.decimalDigits)

    func readInput(_ message: String) -> String {
        print(message)
        let input = readLine()
        guard let inputCoodinates = input else { return "" }
        return inputCoodinates
    }

    func checkInput(_ input: String) -> Bool {
        let check = input.components(separatedBy: validCharacter).filter{ $0 != "" }
        if check.count == 0 { return true } 
        return false
    }
    
    func separateInput(_ input: String) -> Array<String> {
        let coodinates = input.components(separatedBy: ",")
        return coodinates
    }
    
    func createPoint(_ input: [String]) -> MyPoint? {
        guard let first = Int(input[0].dropFirst()), let last = Int(input[1].dropLast()) else { return nil }
        return MyPoint.init(x: first, y: last)
    }
    
}
