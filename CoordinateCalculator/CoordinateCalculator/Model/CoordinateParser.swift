//
//  CoordinatePaser.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 10..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct RawCoordinate {
    private (set) var inputCoordinateValue: String
    
    init() {
        self.inputCoordinateValue = ""
    }
    
    init(_ inputCoordinateValue: String) {
        self.inputCoordinateValue = inputCoordinateValue
    }
    
}
