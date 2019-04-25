//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    static func convertCoordinates(coordinatesText: String) throws -> MyPoint {
        let numbersText = coordinatesText.components(separatedBy: ["(", ")"]).joined().split(separator: ",")
        var numbers: [Int] = []
        
        for numberText in numbersText {
            numbers.append(try convertStringToInt(numberText: String(numberText)))
        }
        
        return try MyPoint(x: numbers[0], y: numbers[1])
    }
    
    private static func convertStringToInt(numberText: String) throws -> Int {
        guard let number = Int(numberText) else {
            throw InputError.invalidInput
        }
        
        return number
    }
}
