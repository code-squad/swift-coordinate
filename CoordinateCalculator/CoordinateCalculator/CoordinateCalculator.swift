//
//  CoordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by JH on 25/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinateCalculatorError: String, Error {
    case unsupportedShape = "지원하지않는 도형입니다"
}


struct CoordinateCalculator {
    static func makeShape(from input: String) throws -> DrawableShape {
        let coordinateValues = try CoordinateConverter.makeCoordinateValues(from: input)
        
        guard let shape = ShapeMaker.makeShape(from: coordinateValues) else {
            throw CoordinateCalculatorError.unsupportedShape
        }
        return shape
    }
}
