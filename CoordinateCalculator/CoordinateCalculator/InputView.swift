//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput(question: String) -> String {
        print(question)
        let value = readLine()!
        return value
    }
}



