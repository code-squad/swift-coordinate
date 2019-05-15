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
        let point = try convertToCoordinateFormat(seperatedUserInput)
        try coordinateIsInRange(point)
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
    
    private mutating func convertToCoordinateFormat(_ seperatedUserInput:[String])throws ->MyPoint{
        let x = try convertToInt(seperatedUserInput[0])
        let y = try convertToInt(seperatedUserInput[1])
        return MyPoint(x: x, y: y)
    }
    
    private func convertToInt(_ seperatedUserInput:String)throws->Int {
        guard let convertedInt = Int(seperatedUserInput) else{
            throw UserInputError.canNotConvertTOInt
        }
        return convertedInt
    }
    
    private func coordinateIsInRange(_ point:MyPoint)throws {
        try isInRange(point.x)
        try isInRange(point.y)
    }
    
    private func isInRange(_ point: Int)throws {
        let range = 0...ANSICode.axis.AxisLimit
        guard range.contains(point) else {
            throw UserInputError.outOfRange
        }
    }
}
