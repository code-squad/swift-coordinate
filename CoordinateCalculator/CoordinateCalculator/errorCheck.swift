//
//  inputCheck.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 19/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorList : String {
    case noInput = "입력값이 없습니다."
    case notNumber = "숫자를 입력하세요."
    case outOfBound = "범위를 벗어나는 입력입니다."
    case breakGuideline = "좌표 형태로 입력하세요."
    case noError
}

// ErrorCheck 구조체의 역할 : 좌표가 올바르게 입력되었는지 확인하고 에러 전달
struct ErrorCheck {
    private var input: String
    
    init(input: String) {
        self.input = input
    }
    
    // 받은 입력을 배열로 바꿔주는 메소드
    private func transform(_ input: String) -> [String] {
        return input.trimmingCharacters(in: ["(",")"]).split(separator: ",").map {String($0)}
    }
    
    // 올바른 형태로 좌표를 입력하는지 확인하는 메소드
    private func isContainElement(_ input: String) -> Bool {
        if input.first! == "(" && input.contains(",") && input.last! == ")" {
            return true
        }
        return false
    }
    
    // 입력값이 존재하는지 확인하는 메소드
    private func isInputEmpty(_ input: String) -> Bool {
        if input.isEmpty {
            return false
        }
        return true
    }
    
    // 입력값이 숫자인지 확인하는 메소드
    private func isNumber(_ input: String) -> Bool {
        let coordinates = transform(input)
        for element in coordinates {
            if Int(element) == nil {
                return false
            }
        }
        return true
    }
    
    // 입력값이 좌표의 범위안의 값인지 확인하는 메소드
    private func isValidRange(_ input: String) -> Bool {
        let coordinates = transform(input).map {Int($0) ?? -1}
        for element in coordinates {
            if !(0...24).contains(element) {
                return false
            }
        }
        return true
    }
    
    // x 좌표 또는 y 좌표가 비었는지 확인하는 메소드
    private func isPointEmpty(_ input: String) -> Bool {
        let coordinates = transform(input).map {Int($0) ?? -1}
        if coordinates.count < 2 {
            return false
        }
        return true
    }
    
    // 입력을 가지고 에러는 잡아내는 메소드
    public func checkInputError() -> ErrorList {
        guard isInputEmpty(self.input) else {return .noInput}
        guard isContainElement(self.input) else {return .breakGuideline}
        guard isNumber(self.input) else {return .notNumber}
        guard isValidRange(self.input) else {return .outOfBound}
        guard isPointEmpty(self.input) else {return .notNumber}
        return .noError
    }
}
