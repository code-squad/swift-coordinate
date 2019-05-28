//
//  figureFactory.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 28/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct figureFactory {
    
    private static var converter = Converter()
    
    static func makeFigure(_ points:[coordinate],_ validator:Validatable) throws -> Drawable {
        switch points.count {
        case 1:
            return MyPoint(x: points[0].0, y: points[0].1)
        case 2:
            let pointA = MyPoint(x: points[0].0, y: points[0].1)
            let pointB = MyPoint(x: points[1].0, y: points[1].1)
            return MyLine(pointA: pointA, pointB: pointB)
        case 3:
            let pointA = MyPoint(x: points[0].0, y: points[0].1)
            let pointB = MyPoint(x: points[1].0, y: points[1].1)
            let pointC = MyPoint(x: points[2].0, y: points[2].1)
            return MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
        default:
            throw UserInputError.isNotFigure
        }
    }
    
}
