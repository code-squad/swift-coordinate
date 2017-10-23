//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func readInput() -> (Int, Int) {
        print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.clear)\(ANSICode.text.white) 좌표를 입력하세요.")
        let input = readLine() ?? ""
        let split = input.index(of: ",") ?? input.endIndex
        let x = input[input.index(input.startIndex, offsetBy: 1)..<split]
        let y = input[input.index(split, offsetBy: 1)..<input.index(before: input.endIndex)]
        
        let xNum: Int = Int(x) ?? 0
        let yNum: Int = Int(y) ?? 0
        return (xNum, yNum)
    }

}
