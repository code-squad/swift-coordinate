//
//  InputValidator.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 05/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

public enum InputError : String {
    case noError
    case outOfRangeInt = "X, Y좌표는 모두 최대 24까지의 정수만 입력 가능합니다."
    case invalidForm = "좌표는 (x,y) 형식으로 입력해주세요."
}

struct InputValidator {
    
    private let leftBracket : Character = "("
    private let rightBracket : Character = ")"
    private let comma : Character = ","
    private let xyCount : Int = 2
    private var input = String()
    
    init(input:String) {
        self.input = input
    }
    
    private func hasBrackets() -> Bool {
        guard input.first == leftBracket else { return false }
        guard input.last == rightBracket else { return false }
        return true
    }
    
    private func hasOneComma() -> Bool {
        guard input.contains(comma) else { return false }
        guard input.firstIndex(of:comma)==input.lastIndex(of:comma) else { return false }
        return true
    }
    
    private func hasBothXY() -> Bool {
        let xy = InputView.separateCoordinate(input:self.input, separator:comma)
        guard xy.count == xyCount else { return false }
        return true
    }
    
    private func isIntInRange() -> Bool {
        let coordinate = InputView.getCoordinate(input:self.input, separator:comma)
        guard let x = Int(coordinate.x) else { return false }
        guard let y = Int(coordinate.y) else { return false }
        if (x > 25 || y > 25) { return false }
        return true
    }
    
    func checkInputError() -> InputError {
        guard hasBrackets() else { return .invalidForm }
        guard hasOneComma() else { return .invalidForm }
        guard hasBothXY() else { return .invalidForm }
        guard isIntInRange() else { return .outOfRangeInt }
        return .noError
    }
    
}
