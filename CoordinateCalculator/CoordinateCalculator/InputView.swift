//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 8..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {

    static private func readText(question: String) -> String {
        print(question)
        return readLine() ?? ""
    }

    static func readInput() -> String {
        return readText(question: "좌표를 입력하세요.")
    }
}
