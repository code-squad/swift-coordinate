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
            return try inputToPoint(values)
        case .line?:
            return try inputToLine(values)
        case .none:
            throw InputError.UndefinedFigure
        }
    }
    
    static private func verifyInputStandard (_ valueEntered: String) throws -> String {
        var value = valueEntered
        
        if value.first != "(" || value.last != ")" {
            throw InputError.NonInputStandard
        }
        value.removeFirst()
        value.removeLast()
        
        return value
    }
    
    static private func verifyCoordinateStandard (_ valueEntered: String) throws -> MyPoint {
        var coordinate = valueEntered.split(separator: ",")
        
        if coordinate.count != 2 {
            throw InputError.NonCoordinateStandard
        }
        
        guard let pointX = Int(coordinate[0]), pointX >= 0 && pointX <= 24 else {
            throw InputError.NonCoordinateStandard
        }
        guard let pointY = Int(coordinate[1]), pointY >= 0 && pointY <= 24 else {
            throw InputError.NonCoordinateStandard
        }
        
        return MyPoint(x: [pointX], y: [pointY])
    }
    
    static private func inputToPoint (_ values: [Substring]) throws -> MyPoint {
        var valueConvertable = String(values[0])
        var point: MyPoint
        
        do {
            valueConvertable = try verifyInputStandard(valueConvertable)
            point = try verifyCoordinateStandard(valueConvertable)
        }
        
        return point
    }
    
    static private func inputToLine (_ values: [Substring]) throws -> MyLine {
        var points = [MyPoint]()
        
        for value in values {
            var valueConvertable = String(value)
            
            do {
                valueConvertable = try verifyInputStandard(valueConvertable)
                points.append(try verifyCoordinateStandard(valueConvertable))
            }
        }
        
        let line = MyLine(x: [points[0].x, points[1].x], y: [points[0].y, points[1].y])
        
        return line
    }
}
