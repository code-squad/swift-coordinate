//
//  UtilSet.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 7..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Utility {
    static func splitInputValue(in input: String) throws -> [MyPoint] {
        let inputValue = input.removeWhitespace()
        
        return try inputValue.split(separator: "-").map({ (s: String.SubSequence) -> (MyPoint) in
            guard String(s).match(for: "\\([0-9]*\\,[0-9]*\\)") else {
                throw InputView.Errors.notFormattedValue
            }
            
            return try splitCoordinates(String(s))
        })
    }
    
    private static func splitCoordinates(_ inputValue: String) throws -> MyPoint {
        let coordinates = inputValue.splitXY()
        
        for coordinate in coordinates {
            guard coordinate.match(for: "^([0-9]|[1][0-9]|[2][0-4])$") else {
                throw InputView.Errors.outOfRangeCoordinate
            }
        }
        
        return MyPoint(x: Int(coordinates[0]) ?? 0, y: Int(coordinates[1]) ?? 0)
    }
    
    static func isRectangle(in points: [MyPoint]) -> Bool {
        guard points[0].x == points[1].x && points[0].y == points[2].y else {
            return false
        }
        
        guard points[2].x == points[3].x && points[1].y == points[3].y else {
            return false
        }
        
        return true
    }
    
    static func sortPoints(this: MyPoint, that: MyPoint) -> Bool {
        var result: Bool = false
        
        if this.x < that.x {
            result = true
        } else if this.x == that.x {
            if this.y < that.y {
                result = true
            }
        }
        
        return result
    }
}
