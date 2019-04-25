//
//  InputVerify.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/23/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputVerify {
    static func verifyInputStandard (_ valueEntered: [String]) throws {
        for value in valueEntered {
            if value.first != "(" || value.last != ")" {
                throw InputError.NonInputStandard
            }
        }
    }
    
    static func verifyCoordinateStandard (_ valueEntered: [String]) throws -> [(Int, Int)]{
        var coordinates: [(Int, Int)] = [(Int, Int)]()
        
        for valueOriginal in valueEntered {
            var value = valueOriginal
            value.removeFirst()
            value.removeLast()
            var coordinate = value.split(separator: ",")
            
            if coordinate.count != 2 {
                throw InputError.NonInputStandard
            }
            
            guard let pointX = Int(coordinate[0]), pointX >= 0 && pointX <= 24 else {
                throw InputError.NonCoordinateStandard
            }
            guard let pointY = Int(coordinate[1]), pointY >= 0 && pointY <= 24 else {
                throw InputError.NonCoordinateStandard
            }
            coordinates.append((pointX, pointY))
        }
        return coordinates
    }
}
