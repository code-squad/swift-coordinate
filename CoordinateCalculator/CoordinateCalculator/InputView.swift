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
    static func ask(_ question: Question) throws -> String {
        print(question.rawValue)
        guard let value = readLine() else {
            throw Error.emptyValue
        }
        return value
    }
    
    static func readInputs() throws -> [String] {
        let value = try ask(.request)
        return value.split(separator: "-").map {String($0)}
    }
}
