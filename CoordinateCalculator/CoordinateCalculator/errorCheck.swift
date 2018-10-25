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
    case breakGuideline = "올바른 형태로 입력하세요."
    case noError
}

// ErrorCheck 구조체의 역할 : 좌표가 올바르게 입력되었는지 확인하고 에러 전달
struct ErrorCheck {
    private var input : String
    
    init(input: String) {
        self.input = input
    }
    
    // --------------- 두 개의 좌표를 입력받았을 때 우선 에러 확인 ---------------
    
    // 입력값이 존재하는지 확인하는 메소드
    private func isInputEmpty(_ input: String) -> Bool {
        if input.isEmpty {
            return false
        }
        return true
    }
    
    // 올바른 형태로 좌표를 입력하는지 확인하는 메소드
    private func isContainElement(_ input: String) -> Bool {
        if input.first! == "(" && input.contains(",") && input.last! == ")" {
            return true
        }
        return false
    }
    
    // 받은 입력을 좌표 순서에 따라 분리하는 메소드
    private func separate(_ input: String) -> [String] {
        return input.split(separator: "-").map {String($0)}
    }
    
    // --------------- 순서에 따라 좌표로 분리하고 난 후 에러 확인 ----------------
    
    // 받은 입력을 좌표 배열로 바꿔주는 메소드
    private func transform(_ point: String) -> [String] {
        return point.trimmingCharacters(in: ["(",")"]).split(separator: ",").map {String($0)}
    }
    
    // 입력값이 숫자인지 확인하는 메소드
    private func isNumber(_ point: String) -> Bool {
        for element in transform(point) {
            if Int(element) == nil {
                return false
            }
        }
        return true
    }
    
    // 입력값이 좌표의 범위안의 값인지 확인하는 메소드
    private func isValidRange(_ point: String) -> Bool {
        for element in transform(point).map({Int($0) ?? -1}) {
            if !(0...24).contains(element) {
                return false
            }
        }
        return true
    }
    
    // x 좌표 또는 y 좌표가 비었는지 확인하는 메소드
    private func isPointEmpty(_ point: String) -> Bool {
        if transform(point).count != 2 {
            return false
        }
        return true
    }
    
    // 입력을 나눈 좌표로 에러는 잡아내는 메소드
    private func errorCheck(_ point: String) -> ErrorList {
        guard isContainElement(point) else {return .breakGuideline}
        guard isNumber(point) else {return .notNumber}
        guard isValidRange(point) else {return .outOfBound}
        guard isPointEmpty(point) else {return .notNumber}
        return .noError
    }
    
    // 좌표가 두개 이상일 때 에러를 잡아내는 메소드
    private func multiErrorCheck(_ input: String) -> ErrorList {
        for element in separate(input) {
            let result = errorCheck(element)
            if result != .noError {
                return result
            }
        }
        return .noError
    }
    
    // 입력을 가지고 에러를 처리하는 메소드
    public func checkInputError() -> ErrorList {
        guard isInputEmpty(self.input) else {return .noInput}
        
        // 입력 형태에 따라 좌표의 수를 나눠서 에처 핸들링
        switch input.split(separator: "-").count {
        case 1:
            return errorCheck(self.input)       // 좌표가 하나 일때,
        case 2:
            return multiErrorCheck(self.input)  // 좌표가 두개 일때,
        case 3:
            return multiErrorCheck(self.input)  // 좌표가 세개 일때,
        default:
            return .noError
        }
    }
}
