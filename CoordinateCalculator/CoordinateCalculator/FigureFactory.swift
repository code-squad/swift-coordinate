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
            return makePoint(using: pairs[0])
        case 2:
            let startPoint = makePoint(using: pairs[0])
            let endPoint = makePoint(using: pairs[1])
            return MyLine(pointA: startPoint, pointB: endPoint)
        case 3:
            let pointA = makePoint(using: pairs[0])
            let pointB = makePoint(using: pairs[1])
            let pointC = makePoint(using: pairs[2])
            return MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
        default:
            throw FactoryError.impossibleToCreateInstance
        }
    }
    
    static private func makePoint(using pair: Pair) -> MyPoint {
        return MyPoint(x: pair.x, y: pair.y)
    }
}
