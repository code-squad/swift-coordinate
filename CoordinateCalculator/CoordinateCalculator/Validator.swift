//
//  Validator.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validator: Validatable {
    
    func isContainFormatItem(_ userInput:String,_ formatItem:String)throws{
        let ConvertedFormatItem = CharacterSet(charactersIn: formatItem)
        let convertedUserInput = CharacterSet(charactersIn:userInput)
        let subtractset = convertedUserInput.subtracting(ConvertedFormatItem)
        guard subtractset.isEmpty == true else{
            throw UserInputError.inCorrectFormat
        }
    }
    
    func isCorrectFormat(_ userInput:String) throws {
        guard userInput.first == "(" && userInput.last == ")" else{
            throw UserInputError.inCorrectFormat
        }
    }
    
    func hasTwoItem(_ seperatedUserInput:[String]) throws {
        guard seperatedUserInput.count == 2 else{
            throw UserInputError.inCorrectItemNumber
        }
    }
    
    func coordinateIsInRange(_ point:(Int,Int)) throws {
        try isInRange(point.0)
        try isInRange(point.1)
    }
    
    func isInRange(_ point: Int) throws {
        let range = 0...ANSICode.axis.AxisLimit
        guard range.contains(point) else {
            throw UserInputError.outOfRange
        }
    }
}
