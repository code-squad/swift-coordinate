//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter: Figure {
    static func inputToFigure (_ valueEntered: String) throws -> Figure {
        var figure: Figure
        let values = valueEntered.split(separator: "-")
        
        switch values.count {
        case 1: figure = try inputToPoint(values)
        case 2: figure = try inputToLine(values)
        default: figure = try inputToLine(values)
        }
        
        return figure
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
        
        return MyPoint(x: pointX, y: pointY)
    }

    static private func inputToPoint (_ values: [String.SubSequence]) throws -> MyPoint {
        var valueConvertable = String(values[0])
        var point: MyPoint
        
        do {
            valueConvertable = try Converter.verifyInputStandard(valueConvertable)
            point = try Converter.verifyCoordinateStandard(valueConvertable)
        }
        
        return point
    }

    static private func inputToLine (_ values: [String.SubSequence]) throws -> MyLine {
        var line = MyLine()
        var points = [MyPoint]()
        
        for value in values {
            var valueConvertable = String(value)
            
            do {
                valueConvertable = try Converter.verifyInputStandard(valueConvertable)
                points.append(try Converter.verifyCoordinateStandard(valueConvertable))
            }
        }
        
        line.pointA = points[0]
        line.pointB = points[1]
        
        return line
    }
}
