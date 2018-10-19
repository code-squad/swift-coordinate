//
//  inputCheck.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 19/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validity {
    private let coordinates: [Int]
    
    init(point: [Int]) {
        self.coordinates = point
    }
    
    public func isRight() -> Bool {
        if (0...24).contains(coordinates[0]) && (0...24).contains(coordinates[1]) {
            return true
        }
        return false
    }
}
