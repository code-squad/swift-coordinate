//
//  CoordinateChecker+Validator.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 13..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Validator {
    func isValid(_ input: String) throws
}

struct CoordinateChecker: Validator {
    
    enum Error: Swift.Error {
        case invalidFormat
        
        var localizedDescription: String {
            switch self {
            case .invalidFormat:
                return "유효하지 않은 형식입니다."
            }
        }
    }
    
    func isValid(_ input: String) throws {
        let regex = "\\(-?[\\d]+,-?[\\d]+\\)"
        guard input.matches(regex) else {
            throw Error.invalidFormat
        }
    }
}
