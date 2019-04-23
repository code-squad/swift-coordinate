//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory{
    static func getFigure(_ type: FigureType?, _ values: [Substring]) throws -> Figure {
        switch type {
        case .point?:
            return inputToPoint(String(values[0]))
        case .line?:
            return inputToLine(values)
        case .triangle?:
            return inputToTriangle(values)
        case .none:
            throw InputError.UndefinedFigure
        }
    }

    static private func inputToPoint (_ valueEntered: String) -> MyPoint {
        var value = valueEntered
        
        value.removeFirst()
        value.removeLast()
        
        let coordinate = value.split(separator: ",")
        let coordinateX: Int = Int(String(coordinate[0])) ?? 0
        let coordinateY: Int = Int(String(coordinate[1])) ?? 0
        
        
        return MyPoint(x: [coordinateX], y: [coordinateY])
    }
    
    static private func inputToLine (_ values: [Substring]) -> MyLine {
        var points = [MyPoint]()
        
        for value in values {
            points.append(inputToPoint(String(value)))
        }
        
        return MyLine(x: [points[0].x, points[1].x], y: [points[0].y, points[1].y])
    }
    
    static private func inputToTriangle (_ values: [Substring]) -> MyTriangle {
        var points = [MyPoint]()
        
        for value in values {
            points.append(inputToPoint(String(value)))
        }
        
        return MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
    }
}
