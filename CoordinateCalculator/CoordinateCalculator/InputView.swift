//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput() -> String {
        print("좌표를 입력하세요.")
        if let inputCoordinate = readLine() {
            return inputCoordinate
        }
        return ""
    }
    
    func separateCoordinateNumber(inputValue: String) throws -> MyPoint {
        
        if inputValue.hasPrefix("(") && inputValue.hasSuffix(")") {
            let rangeOfNumber = inputValue.index(after: inputValue.startIndex)..<inputValue.index(before: inputValue.endIndex)
            if inputValue[rangeOfNumber].range(of: ",") != nil {
                do {
                    return try separateByComma(rangeOfNumber: String(inputValue[rangeOfNumber]))
                } catch CoordinateError.inputValueError {
                    print("입력값 에러")
                }
            }else {
                throw CoordinateError.noCommaError
            }
        }else {
            throw CoordinateError.noBracketError
        }
        throw CoordinateError.theRestError
    }
    
    func separateByComma(rangeOfNumber: String) throws -> MyPoint {
        var myPoint = MyPoint(x: 0, y: 0)
        let values = rangeOfNumber.split(separator: ",").flatMap({Int($0)})
        if values.count != 2 {
            throw CoordinateError.inputValueError
        }else {
            myPoint.x = values[0]
            myPoint.y = values[1]
        }
        return myPoint
    }
}
