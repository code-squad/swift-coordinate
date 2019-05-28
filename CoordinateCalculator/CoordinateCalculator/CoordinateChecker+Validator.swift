//
//  CoordinateChecker+Validator.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 13..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Validator {
    func isValid(_ input: String) -> Bool
}

struct CoordinateChecker: Validator {
    
    func isValid(_ input: String) -> Bool {
        let regex = "\\(-?[\\d]+,-?[\\d]+\\)"
        return input.matches(regex)
    }
}
