//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    
    static func readInput(question:String) throws -> String {
        print(question)

        guard let rawInput = readLine(), !rawInput.isEmpty else {
           throw CoordinateCalculatorError.invalidValue
        }

        return rawInput
    }
    
}
