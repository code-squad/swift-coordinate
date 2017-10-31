//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
// InputView 구조체에서 입력가능한 CharacterSet을 만들어서 입력된 문자열 중에 입력할 수 없는 문자가 포함되어 있는지 비교한다. 입력 불가능한 문자가 포함된 경우 다시 입력받는다.
struct InputView {
    
    func readInput() -> MyPoint {
        print("좌표를 입력하세요.")
        let formula = readLine() ?? ""
        return getPoint(formula: formula)
    }
    
    private func getPoint(formula: String) -> MyPoint {
        let point = formula.trimmingCharacters(in: ["(", ")"]).split(separator: ",")
        if !checkAvailableCharacterSet(formula: formula) {
            print("입력값에 유효하지 않는 문자 혹은 기호가 들어가 있습니다.")
            return readInput()
        }
        if !checkInputValidation(point: point) {
            print("좌표 입력이 올바르지 않습니다.")
            return readInput()
        }
        let myPoint = MyPoint.init(x: Int(point[0])!, y: Int(point[1])!)
        return myPoint
    }
    
    private func checkInputValidation(point: Array<String.SubSequence>) -> Bool {
        guard point.count == 2 else {
            return false
        }
        if Int(point[0]) == nil || Int(point[1]) == nil {
            return false
        }
        if Int(point[0])! <= 0 || Int(point[0])! > 24  || Int(point[1])! <= 0 || Int(point[1])! > 24 {
            print("숫자는 1부터 24까지 가능합니다.")
            return false
        }
        return true
    }
    
    private func checkAvailableCharacterSet(formula: String) -> Bool {
        guard formula.trimmingCharacters(in: getAvailableCharacterSet(custom: "()-,")).count == 0 else {
            return false
        }
        return true
    }
    private func getAvailableCharacterSet(custom: String) -> CharacterSet {
        var availableCharacterSet : CharacterSet = CharacterSet.init(charactersIn: custom)
        availableCharacterSet.formUnion(CharacterSet.decimalDigits)
        return availableCharacterSet
    }
    
}


