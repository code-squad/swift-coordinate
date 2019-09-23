//
//  Utility.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


enum PointValueError : Error {
    case invalidRange
    case invalidFormat
    case samePoints
    case cantBeRectangle
    
    
}


struct Utility {
    static func parsingPointsString(with multiPointString: String) throws -> Array<Point>{
        let pointStrings = splitPointStringArray(pointsString: multiPointString)
        
        //print(pointStringArray)
        
        guard pointStrings.count >= 1 else {
            throw PointValueError.invalidFormat
        }
        
        var points = Array<Point>()
        
        for pointString in pointStrings {
            let point = try parsingStringToXY(pointInBracket: pointString)
            
            points.append(point)
        }
        
        //print(xyTupleArray)
        return points
    }
    
    static func splitPointStringArray(pointsString: String) -> Array<String> {
         return pointsString.split(separator: "-").map{ String($0) }
    }
    
    static func parsingStringToXY(pointInBracket: String) throws -> Point {
        let stringRemovedBracket = String(pointInBracket.map {
            ($0 == "(" || $0 == ")") ? " " : $0
        })
        
        let trimmedString = stringRemovedBracket.filter { !$0.isNewline && !$0.isWhitespace }
        let pointStringArray = trimmedString.split(separator: ",").map{ String($0) }
        
        guard pointStringArray.count == 2 else {
            throw PointValueError.invalidFormat
        }
        
        guard let x = Int(pointStringArray[0]) else {
            throw PointValueError.invalidFormat
        }
        
        guard let y = Int(pointStringArray[1]) else {
            throw PointValueError.invalidFormat
        }
        
        return (x, y)
    }
}
