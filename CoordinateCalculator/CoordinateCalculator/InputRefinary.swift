//
//  Pair.swift
//  CoordinateCalculator
//
//  Created by hw on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct InputRefinary {
    static private let MaxRange: Int = 24
    static private let MinRange: Int = 0
    private (set) var pointPair: Pair
    
    init(_ input : String) throws{
        let (preprocessedX,preprocessedY) = try InputRefinary.splitPoints(input)
        let (xPointDigit,yPointDigit) = try InputRefinary.convertStringToNumber(x: preprocessedX, y: preprocessedY)
        
        if !InputRefinary.isInRange(x: xPointDigit, y: yPointDigit) {
            throw ErrorCode.InvalidRange
        }
        pointPair = Pair(xPointDigit, yPointDigit)
    }
    
    static private func splitPoints (_ point: String) throws -> ( String, String) {
        let splitAPairOfPoint: [String] = point.trimmingCharacters(in: ["(",")"])
            .split(separator: ",")
            .map { (value) in return String(value)}
        if splitAPairOfPoint.count != 2 {
            throw ErrorCode.SplitStringError
        }
        return (splitAPairOfPoint[0], splitAPairOfPoint[1])
    }
    
    static private func convertStringToNumber( x: String,  y: String )throws -> Pair {
        guard let pointX = Int(x) else{
            throw ErrorCode.IsNotANumber
        }
        guard let pointY = Int(y) else{
            throw ErrorCode.IsNotANumber
        }
        return Pair(pointX, pointY)
    }
    
    static private func isInRange(x: Int, y: Int)  -> Bool {
        if x > MaxRange || x < MinRange || y > MaxRange || y < MinRange  {
            return false
        }
        return true
    }
}
