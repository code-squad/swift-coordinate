//
//  convertInput.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 20/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct ConvertInput {
    private let initialValue: String?
    
    init(initialValue: String?) {
        self.initialValue = initialValue
    }
    
    public func convertToPoint() -> [Int] {
        guard let rawValue = initialValue, isContainElement(rawValue) else {
            return [-1,-1]
        }
        return transform(rawValue)
    }
    
    private func isContainElement(_ value: String) -> Bool {
        if value.contains("(") && value.contains(",") && value.contains(")") {
            return true
        }
        return false
    }
    
    private func transform(_ rawValue: String) -> [Int] {
        return rawValue.trimmingCharacters(in: ["(",")"]).split(separator: ",").map {Int($0) ?? -1}
    }
}
