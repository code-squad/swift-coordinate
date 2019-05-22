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
    
    static func makeLine (pointA: MyPoint, pointB: MyPoint) -> MyLine {
        return MyLine(pointA: pointA, pointB: pointB)
    }
    
//    static func makeTriangle (pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) -> MyTriangle {
//        return MyTriangle(pointA: My)
//    }
    
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
    
    static func classifyInput(points: [MyPoint]){
        switch points.count {
        case 1:
            OutputView.draw(points[0])
        case 2:
            let line = Converter.makeLine(pointA: points[0], pointB: points[1])
            OutputView.draw(line)
        case 3:
             let triangle = MyTriangle.init(lineAB: MyLine(pointA: points[0], pointB: points[1]), lineBC: MyLine(pointA: points[1], pointB: points[2]), lineAC: MyLine(pointA: points[0], pointB: points[2]))
            OutputView.draw(triangle)
        default:
            break
        }
    }

}
    

