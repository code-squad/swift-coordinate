//
//  CoordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by JH on 25/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinateCalculatorError: Error {
    case unsupportedShape
}

struct CoordinateCalculator {
    static func makeShape(from input: String) throws -> DrawableShape {
        let coordinateValues = try CoordinateConverter.makeCoordinateValues(from: input)
        
        guard let shape = ShapeMaker.makeShape(fromCoordinateValues: coordinateValues) else {
            throw CoordinateCalculatorError.unsupportedShape
        }
        return shape
    }
}
