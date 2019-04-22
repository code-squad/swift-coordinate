//
//  Validator.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validator {
    
    static func hasComma(coordinates: [String]) -> Bool {
        
        guard coordinates.count > 1 else {
            print("값을 쉼표(,)로 구분해주세요~!~!")
            return false
        }
        return true
        
    }
}
