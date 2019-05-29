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
    
    static func makeFigure(_ points:[coordinate]) throws -> Drawable {
        
        let myPoints:[MyPoint] = points.map{MyPoint(x: $0.0, y: $0.1)}
        
        switch myPoints.count {
        case 1:
            return myPoints[0]
        case 2:
            let myLine = MyLine(pointA: myPoints[0], pointB: myPoints[1])
            try Validator.canDrawLine(line: myLine)
            return myLine
        case 3:
            let triangle = MyTriangle(pointA: myPoints[0], pointB: myPoints[1], pointC: myPoints[2])
            try Validator.canDrawTriangle(triangle: triangle)
            return triangle
        case 4:
            try Validator.canDrawRect(points: points)
            let RectInitItem = convertMyRectInitFormat(points: myPoints)
            return MyRect(origin: RectInitItem.0, size: RectInitItem.1, points: myPoints)
        default:
            throw UserInputError.isNotFigure
        }
    }
    
    static func convertMyRectInitFormat(points:[MyPoint]) -> (MyPoint,CGSize) {
        var x = points.map{$0.x}, y = points.map{$0.y}
        x.sort()
        y.sort()
        let size = CGSize(width: x[3] - x[0], height: y[3] - y[0])
        let oringin = MyPoint(x: x[0], y: y[0])
        return (origin: oringin, size: size)
    }
    
}
