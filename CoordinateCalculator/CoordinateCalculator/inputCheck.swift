//
//  inputCheck.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 19/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputCheck {
    public func isPass(_ rawPoint: [Int]) -> Bool {
        if rawPoint.contains(-1) {
            return false
        }
        return true
    }
}
