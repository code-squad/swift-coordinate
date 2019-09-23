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
}


struct Utility {
    static func parsingPointsString(with multiPointString: String) throws -> Array<XYPosTuple>{
        let pointStringArray = splitPointStringArray(pointsString: multiPointString)
        
        //print(pointStringArray)
        
        guard pointStringArray.count >= 1 else {
            throw PointValueError.invalidFormat
        }
        
        var xyTupleArray = Array<XYPosTuple>()
        
        for pointString in pointStringArray {
            let xyTuple = try parsingStringToXY(pointInBracket: pointString)
            
            xyTupleArray.append(xyTuple)
        }
        
        //print(xyTupleArray)
        return xyTupleArray
    }
    
    static func splitPointStringArray(pointsString: String) -> Array<String> {
         return pointsString.split(separator: "-").map{ String($0) }
    }
    
    static func parsingStringToXY(pointInBracket: String) throws -> XYPosTuple {
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
