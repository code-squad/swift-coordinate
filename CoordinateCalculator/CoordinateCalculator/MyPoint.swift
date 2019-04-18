//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0

    mutating func inputToCoordinate (_ inputView: InputView) throws {
        var value = inputView.valueEntered
        do {
        value = try verifyInputStandard(value)
        (x, y) = try verifyCoordinateStandard(value)
        }
    }
    
    private func verifyInputStandard (_ valueEntered: String) throws -> String {
        var value = valueEntered
        
        if value.removeFirst() != "(" || value.removeLast() != ")" {
            throw InputError.NonInputStandard
        }
        
        return value
    }
    
    private func verifyCoordinateStandard (_ valueEntered: String) throws -> (Int, Int) {
        var coordinate = valueEntered.split(separator: ",")
        
        if coordinate.count != 2 {
            throw InputError.NonCoordinateStandard
        }
        
        guard let pointX = Int(coordinate[0]), pointX >= 0 && pointX <= 24 else {
            throw InputError.NonCoordinateStandard
        }
        guard let pointY = Int(coordinate[1]), pointY >= 0 && pointY <= 24 else {
            throw InputError.NonCoordinateStandard
        }
        
        return (pointX, pointY)
    }
}

