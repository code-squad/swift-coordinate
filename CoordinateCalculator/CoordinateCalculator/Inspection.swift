//
//  Inspector.swift
//  CoordinateCalculator
//
//  Created by cushy k on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: CustomStringConvertible {
    case noValue
    case exceedValue
    case hasNotBracket
    case haveNotTwoInput
    var description: String {
        switch self {
        case .exceedValue:
            return "최대 24까지만 입력 가능합니다"
        case .noValue:
            return "유효한 값을 입력하세요"
        case .hasNotBracket:
            return "괄호가 없습니다"
        case .haveNotTwoInput:
            return "x, y값을 모두 입력해주세요"
        }
    }
    func isSatisfied() -> InputError {
        return self
    }
}


struct Inspection {

    private var letter: String

    init(item: String) {
        self.letter = item
    }

    func point() -> MyPoint? {
        let positionXandY = makePosition()
        return positionXandY
    }

    private func makePosition() -> MyPoint? {

        let points = Convertor(origin: letter).proccessedPoints()
        let positionX = points[0].toInt
        let positionY = points[1].toInt
        return MyPoint(x: positionX, y: positionY)
    }

    private func validate() -> InputError? {
        guard isEntered() else {
            return InputError.noValue.isSatisfied() }
        guard hasBracket() else {
            return InputError.hasNotBracket.isSatisfied() }
        guard isTwo() else {
            return InputError.haveNotTwoInput.isSatisfied() }
        guard isExceed() else {
            return InputError.exceedValue.isSatisfied() }
        return nil
    }

    private func isEntered() -> Bool {
        return !(letter.isEmpty)
    }

    private func hasBracket() -> Bool {
        return letter.contains(")") && letter.contains("(")
    }

    private func isTwo() -> Bool {
        let division = Convertor(origin: letter).proccessedPoints()
        return division.count == 2
    }

    private func isExceed() -> Bool {
        let max = ANSICode.axis.AxisLimit
        let position = Convertor(origin: letter).proccessedPoints()
        let positionX = position[0].toInt
        let positionY = position[1].toInt
        return positionX < max || positionY < max
    }
}
