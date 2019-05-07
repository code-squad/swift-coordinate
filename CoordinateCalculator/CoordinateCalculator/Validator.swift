//
//  Validator.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validator {
    static let AxisLimit = ANSICode.axis.AxisLimit
    static let possibleCharacters = CharacterSet(charactersIn: "(),- ").union(CharacterSet.decimalDigits)
    
    static func validateInput(of prompt: String) -> Bool {
        guard !prompt.isEmpty, uncontainsPossibleCharacter(in: prompt) else {
            return false
        }
        return true
    }
    
    /// prompt에 입력된 문자열 중에 입력할 수 없는 문자가 포함되어 있는지 확인합니다.
    ///
    /// prompt 문자열 Set에 대한 possibleCharater Set의 차집합을 구하고 차집합이 비어있으면 true를 반환합니다.
    /// - Returns: 입력할 수 없는 문자가 포함되어있지 않으면 true를 반환하고, 포함되어 있으면 false를 반환합니다.
    static private func uncontainsPossibleCharacter(in prompt: String) -> Bool {
        let promptCharacters = CharacterSet(charactersIn: prompt)
        let differenceCharacters = promptCharacters.subtracting(possibleCharacters)
        return differenceCharacters.isEmpty
    }
    
    /// 좌표계가 입력할 수 있는 최소값, 최대값을 확인합니다.
    ///
    /// 최소값은 0, 최대값은 24입니다.
    /// 해당 범위를 초과하게 되면 nil을 반환합니다.
    static func checkCoordinatesLimit(coordinates: [[Int]]) -> Bool {
        let coordinates = coordinates.flatMap{$0}
        for coordinate in coordinates {
            guard coordinate < AxisLimit + 1 else {
                return false
            }
            guard coordinate > -1 else {
                return false
            }
        }
        return true
    }
}
