//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory {
    static public func makeFigure(pairs: [Pair]) throws -> AxisDrawable {
        switch pairs.count {
        case 1:
            return MyPoint(pair: pairs[0])
        case 2:
            return MyLine(pairA: pairs[0], pairB: pairs[1])
        default:
            throw CoordinateError.invalidInputFormat
        }
    }
}
