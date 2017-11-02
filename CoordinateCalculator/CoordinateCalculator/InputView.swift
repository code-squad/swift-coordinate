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
    
    enum MessageGuide : String {
        case pointInput = "좌표를 입력하세요."
        case invalidInput = "입력값에 유효하지 않은 문자 혹은 기호가 들어가 있습니다."
        case wrongPoint = "좌표 입력이 올바르지 않습니다."
        case pointRange = "숫자는 1부터 24까지 가능합니다."
    }
    
    func readInput() -> Points {
        print(MessageGuide.pointInput.rawValue)
        let formula = readLine() ?? ""
        if !checkAvailableCharacterSet(formula: formula) {
            print(MessageGuide.invalidInput.rawValue)
            return readInput()
        }
        let inputPoints = formula.split(separator: "-").map({String($0)})
        return getPoints(inputPoints: inputPoints)
    }
    
    private func getPoints(inputPoints: [String]) -> Points {
        var points : Points = []
        for inputPoint in inputPoints {
            points.append(contentsOf: getPoint(formula: inputPoint))
        }
        return points
    }
    
    private func getPoint(formula: String) -> Points {
        let point = formula.trimmingCharacters(in: customCharacterSet).split(separator: ",")
        if !checkInputValidation(point: point) {
            print(MessageGuide.wrongPoint.rawValue)
            return readInput()
        }
        let points : Points = [(x: Int(point[0])!, y: Int(point[1])!)]
        return points
    }
    
    private func checkInputValidation(point: Array<String.SubSequence>) -> Bool {
        guard point.count == 2 else {
            return false
        }
        if Int(point[0]) == nil || Int(point[1]) == nil {
            return false
        }
        if Int(point[0])! <= 0 || Int(point[0])! > 24  || Int(point[1])! <= 0 || Int(point[1])! > 24 {
            print(MessageGuide.pointRange.rawValue)
            return false
        }
        return true
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


