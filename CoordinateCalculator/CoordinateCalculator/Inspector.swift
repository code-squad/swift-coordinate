//
//  Inspector.swift
//  CoordinateCalculator
//
//  Created by cushy k on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case nothing
    case exceedValue
    case hasNotBracket
    case hasNotTwoInput
    var description: String {
        switch self {
        case .exceedValue:
            return "최대 24까지만 입력 가능합니다"
        case .nothing:
            return "좌표를 입력해주세요"
        case .hasNotBracket:
            return "괄호가 없습니다"
        case .hasNotTwoInput:
            return "x, y값을 각각 하나씩만 입력해주세요"
        }
    }
}

struct Inspector {
    private var letter: String


    private func hasBracket() -> Bool {
        return letter.contains(")") && letter.contains("(")
    }

    private func isTwo() -> Bool {
        let division = letter.split(separator: ",").map{ String($0) }
        return division.count == 2
    }

    private func isEntered() -> Bool {
        return !(letter.isEmpty)

    }

    private func isExceed() -> Bool {
        let max = 24
        let position = Convertor.remove(bracket: letter).split(separator: ",").map { String($0) }
        let positionX = position[0].toInt
        let positionY = position[1].toInt
        return positionX > max || positionY > max
    }
}
