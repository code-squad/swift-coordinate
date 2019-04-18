//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    static func inputToPointCoordinate (_ valueEntered: String) throws -> MyPoint {
        var point = MyPoint()
        var value = valueEntered
        
        do {
            value = try verifyInputStandard(value)
            point = try verifyCoordinateStandard(value)
        }
        
        return point
    }
    
    static private func verifyInputStandard (_ valueEntered: String) throws -> String {
        var value = valueEntered
        
        if value.first != "(" || value.last != ")" {
            throw InputError.NonInputStandard
        }
        value.removeFirst()
        value.removeLast()
        
        return value
    }
    
    static private func verifyCoordinateStandard (_ valueEntered: String) throws -> MyPoint {
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
        
        return MyPoint(x: pointX, y: pointY)
    }
}
