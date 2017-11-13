//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    enum Errors: String, Error {
        case emptyValue = "입력값이 없습니다."
        case outOfRangeCoordinate = "입력값이 범위를 벗어났습니다. 0-24 사이값으로 입력하세요."
        case notFormattedValue = "입력형식이 유효하지 않습니다."
    }
    
    func readInput() throws -> [MyPoint] {
        print("좌표를 입력하세요.", terminator: "\n")
        
        guard let inputValue = readLine() else {
            throw InputView.Errors.emptyValue
        }
        
        if inputValue == "q" || inputValue == "quit" {
            return []
        }
                
        return try Utility.splitInputValue(in: inputValue)
    }
}
