//
/******************************************************************************
 * File Name        : InputProcessor.swift
 * Description      : RacingCar
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

struct InputProcessor {
    
    func canUse(syntex input: String?)throws -> Bool {
        guard let input = input else {
            throw ErrorType.isNotString
        }
        return (input.count > 1)
    }
    
    func seperate(_ input: String?) -> [String] {
        var inputs: [String] = []
        
        if let input = input {
            inputs = input.components(separatedBy: "-")
        }
        
        return inputs
    }
    
    func makePoint(_ input: String?)throws -> Coodinatable? {
        guard let input = input else {
            throw ErrorType.isNotString
        }
        let inputToSplit = input
        let trimedInput = inputToSplit.trimmingCharacters(in: ["(", ")"])
        let strNumbers = trimedInput.components(separatedBy: ",")
        
        guard strNumbers.count == 2 else {
            throw ErrorType.inCorrectFormat
        }
        
        guard let first = strNumbers.first,
            let firstNum = Int(first) else {
                throw ErrorType.canNotConvertToInt
        }
        
        guard let second = strNumbers.last,
            let secondNum = Int(second) else {
                throw ErrorType.canNotConvertToInt
        }
        
        return MyPoint(firstNum, secondNum)
    }
    
    func makePolygon(_ inputs: [Coodinatable])throws -> Polygonable {
        var polygon: Polygonable? = nil
        
        switch (inputs.count) {
        case 2:
            polygon = MyLine(pointA: inputs[0] as! MyPoint, pointB: inputs[1] as! MyPoint)
        default:
            polygon = inputs.first as! MyPoint
        }
        
        if polygon == nil {
            throw ErrorType.canNotConvertToPolygon
        }
        
        return polygon!
    }
}
