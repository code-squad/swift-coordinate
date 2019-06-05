//
//  Validator.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation
struct Validator {
    var userInput = ""
    
    mutating func verifyInput(_ userInputOptionalString:String?)throws ->MyPoint {
        try convertString(userInputOptionalString)
        try isCorrectFormat()
        let seperatedUserInput = seperate()
        try hasTwoItem(seperatedUserInput)
        let point = try convertInt(seperatedUserInput)
        try isInRange(point.x)
        try isInRange(point.y)
        return point
    }
    
    
    private mutating func convertString(_ optionalString:String?)throws {
        guard let convertedString = optionalString else{
            throw UserInputError.isNotString
        }
        userInput = convertedString
    }
    
    private func isCorrectFormat()throws {
        guard userInput.first == "(" && userInput.last == ")" else{
            throw UserInputError.inCorrectFormat
        }
    }
    
    private mutating func seperate()->[String] {
        userInput = userInput.trimmingCharacters(in: ["(",")"])
        return userInput.components(separatedBy: ",")
    }
    
    private mutating func hasTwoItem(_ seperatedUserInput:[String])throws {
        guard seperatedUserInput.count == 2 else{
            throw UserInputError.inCorrectItemNumber
        }
    }
    
    private mutating func convertInt(_ seperatedUserInput:[String])throws ->MyPoint{
        guard let x = Int(seperatedUserInput[0]) else{
            throw UserInputError.canNotConvertTOInt
        }
        guard let y = Int(seperatedUserInput[1]) else{
            throw UserInputError.canNotConvertTOInt
        }
        return MyPoint(x: x, y: y)
    }
    
    private func isInRange(_ point: Int)throws {
        let range = 0...ANSICode.axis.AxisLimit
        guard range.contains(point) else {
            throw UserInputError.outOfRange
        }
    }
}
