//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    var validator:Validatable = Validator()
    let formatItem = FormatItem()
    
    mutating func converterChoice(_ userInput:String)throws ->Drawable {
        if validator.isContainPointSeparator(userInput){
            return try convertToLine(userInput)
        }
        return try convertToPoint(userInput)
    }
    
    private mutating func convertToLine(_ userInput:String)throws -> MyLine {
        let seperatedInput = userInput.components(separatedBy: formatItem.pointSeparator)
        //seperatedInput.count == 2 ???
        let mypoints = try seperatedInput.map{try convertToPoint($0)}
        return MyLine(pointA: mypoints[0], pointB: mypoints[1])
    }
    
    
    private mutating func convertToPoint(_ userInput:String)throws ->MyPoint {
        try validator.isCorrectFormat(userInput)
        let seperatedUserInput = seperateToCoordinate(userInput)
        try validator.hasTwoItem(seperatedUserInput)
        let point = try convertToCoordinateFormat(seperatedUserInput)
        try validator.coordinateIsInRange(point)
        return convertMypoint(point: point)
    }
    
    private func seperateToCoordinate(_ userInput:String)->[String] {
        let transformateduserInput = userInput.trimmingCharacters(in: formatItem.coordinateContainer)
        return transformateduserInput.components(separatedBy: formatItem.coordinateItemSeparator)
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
        let x = point.0 * 2 + 2
        let y = (ANSICode.axis.AxisLimit - point.1) + 1
        return MyPoint(x: x, y: y)
    }
    
}
