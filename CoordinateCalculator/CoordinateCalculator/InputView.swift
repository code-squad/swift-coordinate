//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    static func readPointInput() -> MyPoint {
        print("좌표를 입력하세요.")
        let inputString = readLine() ?? ""
        let point = StringConverter.convertToPoint(str: inputString)
        guard point.isValid else {
            print("좌표 범위 에러")
            return readPointInput()
        }
        return point
    }
    
    static func readLineInput() -> MyLine {
        print("좌표를 입력하세요.")
        let inputString = readLine() ?? ""
        let line = StringConverter.convertToLine(str: inputString)
        guard line.isValid else {
            print("좌표 범위 에러")
            return readLineInput()
        }
        return line
    }
}

protocol ValidIdentiable {
    var isValid: Bool { get }
}

extension MyPoint: ValidIdentiable {
    var isValid: Bool {
        return x <= 24 && y <= 24
    }
}

extension MyLine: ValidIdentiable {
    var isValid: Bool {
        return pointA.isValid && pointB.isValid
    }
}
