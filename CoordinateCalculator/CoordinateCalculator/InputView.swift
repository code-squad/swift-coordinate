//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

public enum InputError: Error {
    case emptyInput
    case invalidInput
    case outOfNumber
}

struct InputView {
    
    static func readInput() throws -> MyPoint? {
        print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.clear)\(ANSICode.text.white) 좌표를 입력하세요. 종료하려면 엔터 입력.")
        guard let input = readLine() else { throw InputError.emptyInput }
        if input == "" { return nil }
        guard let split = input.index(of: ",") else { return nil }
        let x = input[input.index(input.startIndex, offsetBy: 1)..<split]
        let y = input[input.index(split, offsetBy: 1)..<input.index(before: input.endIndex)]
        
        guard let xNum: Int = Int(x) else { throw InputError.invalidInput }
        guard let yNum: Int = Int(y) else { throw InputError.invalidInput }
        if xNum > 24 || yNum > 24 { throw InputError.outOfNumber }
        return MyPoint(x: xNum, y: yNum)
    }
}
