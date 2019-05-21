//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    mutating func convertInput(_ userInputOptionalString:String?,_ validator:Validatable )throws ->MyPoint {
        let userInput = try convertString(userInputOptionalString)
        try validator.isCorrectFormat(userInput)
        let seperatedUserInput = seperate(userInput)
        try validator.hasTwoItem(seperatedUserInput)
        let point = try convertToCoordinateFormat(seperatedUserInput)
        try validator.coordinateIsInRange(point)
        return convertMypoint(point: point)
    }
    
    private func convertString(_ optionalString:String?)throws ->String{
        guard let convertedString = optionalString else{
            throw UserInputError.isNotString
        }
        return convertedString
    }
    
    private func seperate(_ userInput:String)->[String] {
        let transformateduserInput = userInput.trimmingCharacters(in: ["(",")"])
        return transformateduserInput.components(separatedBy: ",")
    }
    
    private func convertToCoordinateFormat(_ seperatedUserInput:[String])throws ->(Int,Int){
        let x = try convertToInt(seperatedUserInput[0])
        let y = try convertToInt(seperatedUserInput[1])
        return (x,y)
    }
    
    private func convertToInt(_ seperatedUserInput:String)throws->Int {
        guard let convertedInt = Int(seperatedUserInput) else{
            throw UserInputError.canNotConvertToInt
        }
        return convertedInt
    }
    
    private func convertMypoint(point:(Int,Int)) -> MyPoint {
        return MyPoint(x: point.0, y: point.1)
    }
    
}
