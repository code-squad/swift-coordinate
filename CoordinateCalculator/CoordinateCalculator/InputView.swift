//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    let customCharacterSet : CharacterSet = CharacterSet.init(charactersIn: "()-,")
    
    func readInput() throws -> Points {
        let formula = readLine() ?? ""
        if !checkAvailableCharacterSet(formula: formula) {
            throw CustomErrors.InputError.invalidCharacter
        }
        let inputPoints = formula.split(separator: "-").map({String($0)})
        return try getPoints(inputPoints: inputPoints)
    }
    
    private func getPoints(inputPoints: [String]) throws -> Points {
        var points : Points = []
        for inputPoint in inputPoints {
            points.append(contentsOf: try getPoint(formula: inputPoint))
        }
        return points
    }
    
    private func getPoint(formula: String) throws -> Points {
        let point = formula.trimmingCharacters(in: customCharacterSet).split(separator: ",")
        try checkInputValidation(point: point)
        let points : Points = [(x: Int(point[0])!, y: Int(point[1])!)]
        return points
    }
    
    private func checkInputValidation(point: Array<String.SubSequence>) throws {
        guard point.count == 2 else {
            throw CustomErrors.InputError.wrongPoint
        }
        if Int(point[0]) == nil || Int(point[1]) == nil {
            throw CustomErrors.InputError.wrongPoint
        }
        if Int(point[0])! <= 0 || Int(point[0])! > 24  || Int(point[1])! <= 0 || Int(point[1])! > 24 {
            throw CustomErrors.InputError.invalidRange
        }
    }
    
    private func checkAvailableCharacterSet(formula: String) -> Bool {
        guard formula.trimmingCharacters(in: getAvailableCharacterSet()).count == 0 else {
            return false
        }
        return true
    }
    private func getAvailableCharacterSet() -> CharacterSet {
        var availableCharacterSet : CharacterSet = customCharacterSet
        availableCharacterSet.formUnion(CharacterSet.decimalDigits)
        return availableCharacterSet
    }
    
}


