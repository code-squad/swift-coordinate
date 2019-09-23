//
/******************************************************************************
 * File Name        : InputVerifier.swift
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

struct InputVerifier {
    
    func canUse(syntex input: String) -> Bool {
           return (input.count > 1)
    }
    
    func parseToPoint(_ input: String) -> Coodinatable? {
        let inputToSplit = input
        let trimedInput = inputToSplit.trimmingCharacters(in: ["(", ")"])
        let strNumbers = trimedInput.components(separatedBy: ",")
        
        guard strNumbers.count == 2 else{
            return nil
        }
        
        guard let first = strNumbers.first,
            let firstNum = Int(first) else {
                return nil
        }
        
        guard let second = strNumbers.last,
            let secondNum = Int(second) else {
                return nil
        }
        
        return MyPoint(firstNum, secondNum)
    }
    
}
