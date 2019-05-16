//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    static func makePoint (pointArray: [Int]) throws -> MyPoint {
        guard pointArray.count == 2 else {
            throw Error.wrongFormat
        }
        return MyPoint(x: pointArray[0], y: pointArray[1])
    }
    
    static func makeLine (pointArray: [MyPoint]) throws -> MyLine {
        guard pointArray.count == 2 else {
            throw Error.wrongFormat
        }
        return MyLine(pointA: pointArray[0], pointB: pointArray[1])
    }
    
    static func checkPointToInt(point: String) throws -> Int {
        guard let point = Int(point) else {
            throw Error.notIntValue
        }
        return point
    }
    
    static func ConvertInput(input: String) throws -> [Int] {
        var input = input
        
        if try Validator.validateFormatChecker(input: input) {
            input.removeFirst()
            input.removeLast()
            let points = input.split(separator: ",").map{String($0)}
            let convertPointstoInt = try points.map { try checkPointToInt(point: $0)
            }
            
            for point in convertPointstoInt{
                try Validator.validateRange(number: point)
            }
            return convertPointstoInt
        }
        throw Error.wrongFormat
    }
    
    static func classifyInput(points: [MyPoint]) throws {
        switch points.count {
        case 1:
            OutputView.drawPoint(points[0])
        case 2:
            let line = try Converter.makeLine(pointArray: points)
            OutputView.drawLine(line)
            
        default:
            break
        }
    }

}
    

