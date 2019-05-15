//
//  Validator.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation
struct Validator {
    
    mutating func verifyInput(_ userInputOptionalString:String?)throws ->(Int,Int) {
        let userInput = try convertString(userInputOptionalString)
        try isCorrectFormat(userInput)
        let seperatedUserInput = seperate(userInput)
        try hasTwoItem(seperatedUserInput)
        let point = try convertToCoordinateFormat(seperatedUserInput)
        try coordinateIsInRange(point)
        return point
    }
    
    
    private mutating func convertString(_ optionalString:String?)throws ->String{
        guard let convertedString = optionalString else{
            throw UserInputError.isNotString
        }
        return convertedString
    }
    
    private func isCorrectFormat(_ userInput:String)throws {
        guard userInput.first == "(" && userInput.last == ")" else{
            throw UserInputError.inCorrectFormat
        }
    }
    
    private mutating func seperate(_ userInput:String)->[String] {
        let transformateduserInput = userInput.trimmingCharacters(in: ["(",")"])
        return transformateduserInput.components(separatedBy: ",")
    }
    
    private mutating func hasTwoItem(_ seperatedUserInput:[String])throws {
        guard seperatedUserInput.count == 2 else{
            throw UserInputError.inCorrectItemNumber
        }
    }
    
    private mutating func convertToCoordinateFormat(_ seperatedUserInput:[String])throws ->(Int,Int){
        let x = try convertToInt(seperatedUserInput[0])
        let y = try convertToInt(seperatedUserInput[1])
        return (x,y)
    }
    
    private func convertToInt(_ seperatedUserInput:String)throws->Int {
        guard let convertedInt = Int(seperatedUserInput) else{
            throw UserInputError.canNotConvertTOInt
        }
        return convertedInt
    }
    
    private func coordinateIsInRange(_ point:(Int,Int))throws {
        try isInRange(point.0)
        try isInRange(point.1)
    }
    
    private func isInRange(_ point: Int)throws {
        let range = 0...ANSICode.axis.AxisLimit
        guard range.contains(point) else {
            throw UserInputError.outOfRange
        }
    }
}
