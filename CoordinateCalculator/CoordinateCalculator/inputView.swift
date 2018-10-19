//
//  inputView.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var mention: String
    
    init(mention: String) {
        self.mention = mention
    }
    
    public func readInput() -> [Int] {
        print(mention)
        let rawValue = readLine()
        return Validity(rawValue)
    }
    
    private func Validity(_ rawValue: String?) -> [Int] {
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
