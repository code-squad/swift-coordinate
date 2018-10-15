//
//  InputValidator.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 05/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

public enum TextValidation: String {
    case success
    case invalidForm = "좌표는 (x,y) 형식으로 입력해주세요."
    case noOneComma = "(x,y) 형식으로 컴마로 x좌표와 y좌표를 구분해주세요."
    case noBothXY = "(x,y) 형식으로 x좌표와 y좌표를 모두 입력해주세요."
    case outOfRangeInt = "X, Y좌표는 모두 0부터 최대 24까지의 정수만 입력 가능합니다."
}

struct TextValidator {
    private let leftBracket: Character = "("
    private let rightBracket: Character = ")"
    private let comma: Character = ","
    private let xyCount: Int = 2
    private let minNum: Int = 0
    private let maxNum: Int = 24
    private let validCharacterSet = CharacterSet.init(charactersIn: "0123456789(),")
    private var text = String()
    
    init(text: String) {
        self.text = text
    }
    
    func hasNoInvalidCharacter() -> Bool {
        return (text.rangeOfCharacter(from: validCharacterSet.inverted) == nil)
    }
    
    private func hasBrackets() -> Bool {
        guard text.first == leftBracket else { return false }
        guard text.last == rightBracket else { return false }
        return true
    }
    
    private func hasOneComma() -> Bool {
        guard text.contains(comma) else { return false }
        guard text.firstIndex(of: comma)==text.lastIndex(of: comma) else { return false }
        return true
    }
    
    private func hasBothXY() -> Bool {
        let xy = text.removeBothFirstAndLast().splitByComma()
        guard xy.count == xyCount else { return false }
        return true
    }
    
    private func isInRange(num: Int) -> Bool {
        return (minNum <= num && num <= maxNum)
    }
    
    private func isIntInRange() -> Bool {
        let coordinates = text.removeBothFirstAndLast().splitByComma()
        for coordinate in coordinates {
            guard let coordinateValue = Int(coordinate) else { return false }
            guard isInRange(num: coordinateValue) else { return false }
        }
        return true
    }
    
    func checkTextError() -> TextValidation {
        guard hasBrackets() else { return .invalidForm }
        guard hasOneComma() else { return .noOneComma }
        guard hasBothXY() else { return .noBothXY }
        guard isIntInRange() else { return .outOfRangeInt }
        return .success
    }
}

