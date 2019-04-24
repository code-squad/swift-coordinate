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
        let inputNumbers = readInput()
        let (x, y): (Int, Int) = inputNumbers
        let point = MyPoint(x: x, y: y)
        OutputView.drawAxis()
        OutputView.drawYellowDot(at: point)
        
    }
    
    static private func readInput() -> (Int, Int) {
        var input: (Int, Int)!
        repeat {
            input = InputView.readInput()
            if isInvalid(input) {
                noticeOutOfAxisRange()
            }
        } while isInvalid(input)
        return input
    }
    
    static public func isInvalid(_ input: (Int, Int)?) -> Bool {
        guard let (x, y) = input else {
            return true
        }
        let isOutOfAxis = x > ANSICode.axis.AxisLimit || y > ANSICode.axis.AxisLimit || x < 0 || y < 0
        return isOutOfAxis
    }
    
    static public func noticeOutOfAxisRange() {
        let notice = "좌표 범위를 벗어났습니다. "
        print(notice)
    }
}
