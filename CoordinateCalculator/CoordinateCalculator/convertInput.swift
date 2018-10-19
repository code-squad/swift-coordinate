//
//  convertInput.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 20/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct ConvertInput {
    public func Validity(_ rawValue: String?) -> [Int] {
        guard let value = rawValue, containElement(value) else {
            return [-1,-1]
        }
        return convertToPoint(value)
    }
    
    private func containElement(_ value: String) -> Bool {
        if value.contains("(") && value.contains(",") && value.contains(")") {
            return true
        }
        return false
    }
    
    private func convertToPoint(_ initialValue: String) -> [Int] {
        return initialValue.trimmingCharacters(in: ["(",")"]).split(separator: ",").map {Int($0) ?? -1}
    }
}
