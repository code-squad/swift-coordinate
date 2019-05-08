//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum Question: String {
    case request = "좌표를 입력하세요. ex.(10,10)"
}


struct InputView {
    static func readInput(_ question: Question) -> String {
        print(question.rawValue)
        let value = readLine()!
        return value
    }
}



