//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 4..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
import Foundation

struct InputView {
    static func readInput(q question: String) throws -> String {
        OutputView.questionMessge(msg: question)
        guard let readinput = readLine() else {
            throw CoordinateError.isNil
        }
        return readinput
    }
}
