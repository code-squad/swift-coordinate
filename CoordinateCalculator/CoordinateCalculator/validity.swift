//
//  inputCheck.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 19/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validity {
    public func isRight(point: String) -> Bool {
        let coordinates = Validity(point)
        
        if (0...24).contains(coordinates[0]) || (0...24).contains(coordinates[1]) {
            return true
        }
        return false
    }
}
