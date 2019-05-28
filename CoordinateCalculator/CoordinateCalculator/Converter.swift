//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias coordinate = (Int,Int)

struct Converter {
    
    mutating func convertToPoints(_ userInput:String,_ validator:Validatable) throws -> [coordinate] {
        let seperatedPoints = seperateToPoints(userInput,validator)
        try validator.belowthreePoint(seperatedPoints)
        let points = try seperatedPoints.map{try convertToPoint($0, validator)}
        return points
    }
    
    private func seperateToPoints(_ userInput:String,_ validator:Validatable) -> [String] {
        if validator.isContainPointSeparator(userInput) {
            return userInput.components(separatedBy: FormatItem.pointSeparator)
        }
        return [userInput]
    }
    
    private mutating func convertToPoint(_ userInput:String,_ validator:Validatable) throws -> coordinate {
        try validator.isContainPointFormat(userInput)
        try validator.isCorrectFormat(userInput)
        let seperatedUserInput = seperateToCoordinate(userInput)
        try validator.hasTwoItem(seperatedUserInput)
        let point = try convertToCoordinateFormat(seperatedUserInput)
        try validator.coordinateIsInRange(point)
        return point
    }
    
    private func seperateToCoordinate(_ userInput:String) -> [String] {
        let transformateduserInput = userInput.trimmingCharacters(in: FormatItem.coordinateContainer)
        return transformateduserInput.components(separatedBy: FormatItem.coordinateItemSeparator)
    }
    
    private func convertToCoordinateFormat(_ seperatedUserInput:[String]) throws -> (Int,Int) {
        let x = try convertToInt(seperatedUserInput[0])
        let y = try convertToInt(seperatedUserInput[1])
        return (x,y)
    }
    
    private func convertToInt(_ seperatedUserInput:String) throws -> Int {
        guard let convertedInt = Int(seperatedUserInput) else{
            throw UserInputError.canNotConvertToInt
        }
        return convertedInt
    }
    
}
