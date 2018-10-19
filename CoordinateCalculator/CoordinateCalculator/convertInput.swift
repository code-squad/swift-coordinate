//
//  convertInput.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 20/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// ConvertInput 구조체의 역할 : 입력 형태가 올바른지 확인하고, 올바른 경우 정수형으로 변환
struct ConvertInput {
    private let initialValue: String?
    
    init(initialValue: String?) {
        self.initialValue = initialValue
    }
    
    // 잘못된 입력이 들어온 경우, 올바른 입력이 들어온 경우 데이터 형태 변환 & 반환하는 메소드
    public func convertToPoint() -> [Int] {
        guard let rawValue = initialValue, isContainElement(rawValue) else {
            return [-1,-1]
        }
        return transform(rawValue)
    }
    
    // 입력 형태가 올바른지 확인하는 메소드
    private func isContainElement(_ value: String) -> Bool {
        if value.contains("(") && value.contains(",") && value.contains(")") {
            return true
        }
        return false
    }
    
    // 입력받은 값(String)을 정수형 데이터 타입으로 변환
    private func transform(_ rawValue: String) -> [Int] {
        return rawValue.trimmingCharacters(in: ["(",")"]).split(separator: ",").map {Int($0) ?? -1}
    }
}
