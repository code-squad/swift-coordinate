//
//  CoordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalulator {
    static public func run() {
        let (inputX, inputY): (Int, Int) = readInput()
        let point = MyPoint(x: inputX, y: inputY)
        OutputView.drawAxis()
        OutputView.drawYellowDot(at: point)
    }
    
    static private func readInput() -> (Int, Int) {
        var validNumbers: (Int, Int)!
        while true {
            guard let input = InputView.readInput() else {
                noticeInvalidInput()
                continue
            }
            if CoordinateValidator.isOutOfAxis(using: input) {
                noticeOutOfAxisRange()
                continue
            }
            if CoordinateValidator.isInAxis(using: input) {
                validNumbers = input
                break
            }
        }
        return validNumbers
    }
    
    static public func noticeOutOfAxisRange() {
        let notice = "좌표 범위를 벗어난 입력입니다. 다시 입력해주세요. "
        print(notice)
    }
    
    static func noticeInvalidInput() {
        let notice = "잘못된 형식의 입력입니다. 다시 입력해주세요."
        print(notice)
    }
}
