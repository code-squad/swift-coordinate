//
//  CoordinateCalculatorError.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinateCalculatorError:Error {
    case invalidValue
    case invalidFormat
}

extension CoordinateCalculatorError:LocalizedError{
    public var errorDescription:String?{
        switch self {
        case .invalidValue:
            return "유효하지 않은 값입니다."
        case .invalidFormat:
            return "유요하지 않은 형식입니다."
        }
    }
}
