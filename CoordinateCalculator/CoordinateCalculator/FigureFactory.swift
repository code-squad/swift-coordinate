//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory{
    static func getFigure(_ values: [String]) throws -> Figure {
        switch values.count {
        case 1: return inputToPoint(values[0])
        case 2: return MyLine(pointA: inputToPoint(values[0]), pointB: inputToPoint(values[1]))
        case 3: return MyTriangle(pointA: inputToPoint(values[0]), pointB: inputToPoint(values[1]), pointC: inputToPoint(values[2]))
        default: throw InputError.UndefinedFigure
        }
    }

    static private func inputToPoint (_ valueEntered: String) -> MyPoint {
        var value = valueEntered
        
        value.removeFirst()
        value.removeLast()
        
        let coordinate = value.split(separator: ",")
        let coordinateX: Int = Int(String(coordinate[0])) ?? 0
        let coordinateY: Int = Int(String(coordinate[1])) ?? 0
        
        return MyPoint(x: coordinateX, y: coordinateY)
    }
}
