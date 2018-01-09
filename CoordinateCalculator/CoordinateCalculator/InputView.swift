//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 9..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func readInput() -> Array<String>? {
        print("좌표를 입력하세요 ex)(10,10) " )
        let input = readLine()
        guard let inputCoodinates = input else { return nil }
        let coodinates = inputCoodinates.components(separatedBy: ",")
        return coodinates
    }
    
    func separateCoodinates(_ input: [String]) -> MyPoint {
        let first = Int(input[0].dropFirst())
        let last = Int(input[1].dropLast())
        return MyPoint.init(x: first!, y: last!)
    }
    
}
