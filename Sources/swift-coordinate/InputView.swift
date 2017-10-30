//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func readInput() -> MyPoint {
        print("좌표를 입력하세요.")
        let formula = readLine() ?? ""
        return getPoint(formula: formula)
    }
    
    private func getPoint(formula: String) -> MyPoint {
        let point = formula.trimmingCharacters(in: ["(", ")"]).split(separator: ",")
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
    
}


