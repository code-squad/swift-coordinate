//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    private let customCharacterSet : CharacterSet = CharacterSet.init(charactersIn: "()-,")
    
    func readInput() -> Points {
        print("좌표를 입력하세요.")
        let formula = readLine() ?? ""
        if !checkAvailableCharacterSet(formula: formula) {
            print("입력값에 유효하지 않은 문자 혹은 기호가 들어가 있습니다.")
            return readInput()
        }
        let points = formula.split(separator: "-").map({String($0)})
        return getPoints(points: points)
    }
    
    private func getPoints(points: [String]) -> Points {
        switch points.count {
        case 2:
            return getLine(formulas: points)
        case 3:
            return getTriangle(formulas: points)
        default:
            return getPoint(formula: points.joined())
        }
    }
    
    private func getTriangle(formulas: [String]) -> Points {
        let pointA : MyPoint = getPoint(formula: formulas[0]) as! MyPoint
        let pointB : MyPoint = getPoint(formula: formulas[1]) as! MyPoint
        let pointC : MyPoint = getPoint(formula: formulas[2]) as! MyPoint
        return MyTriangle.init(pointA: pointA, pointB: pointB, pointC: pointC)
    }
    
    private func getLine(formulas: [String]) -> Points {
        let pointA : MyPoint = getPoint(formula: formulas[0]) as! MyPoint
        let pointB : MyPoint = getPoint(formula: formulas[1]) as! MyPoint
        return MyLine.init(pointA: pointA, pointB: pointB)
    }
    
    private func getPoint(formula: String) -> Points {
        let point = formula.trimmingCharacters(in: customCharacterSet).split(separator: ",")
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


