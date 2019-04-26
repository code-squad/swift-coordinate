//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory {
    static public func makeFigure(numbers: [Int]) throws -> AxisDrawable {
        switch numbers.count {
        case 2:
            return MyPoint(using: numbers)
        case 4:
            return MyLine(using: numbers)
        default:
            throw CoordinateError.invalidInputFormat
        }
    }
}
