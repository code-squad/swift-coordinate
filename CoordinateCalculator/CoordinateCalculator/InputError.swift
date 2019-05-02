//
//  InputError.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidInput
    case invalidFormat
    case invalidRange
}

extension InputError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "입력 오류"
        case .invalidFormat:
            return "입력 형식 오류"
        case .invalidRange:
            return "입력 범위 초과"
        }
    }
}
