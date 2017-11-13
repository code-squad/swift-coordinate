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
}
