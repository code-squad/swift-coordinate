//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Pair = (x: Int, y: Int)

struct InputView {
    static private let question = "좌표를 입력하세요. "
    static public func readInput() throws -> String {
        print(question)
        guard let input = readLine(), CoordinateValidator.isValidInputFormat(input) else {
            throw InputFormatError.invalidFormat
        }
        return input
    }
}
