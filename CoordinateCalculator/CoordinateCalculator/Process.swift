//
//  Process.swift
//  CoordinateCalculator
//
//  Created by JH on 10/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorMessage: Error {
    case noInput
    case incorrectInput
    case rangeOver
    
    var description: String {
        switch self {
        case .noInput:
            return "입력값이 없습니다"
        case .incorrectInput:
            return "숫자를 입력해주세요"
        case .rangeOver:
            return "입력범위를 초과했습니다"
        }
    }
}

struct Process {
    
    static func trimAndSplit(inputValue: String) -> [String] {
        let trimmedValue = inputValue.trimmingCharacters(in: ["(",")"])
        let splitedValues = trimmedValue.components(separatedBy: ",")
        
        return splitedValues
    }

    
    static func makeCoordinateValueFrom(inputs: [String]) -> (Int,Int) {
        guard let xValue = Int(inputs[0]), let yValue = Int(inputs[1]) else {
            return (0,0)
        }
        
        return (xValue, yValue)
    }
    
    
//    static func point(from input: (Int,Int)) -> MyPoint {
//        let formattedInput = input
//
//        return MyPoint(x: formattedInput.0, y: formattedInput.1)
//    }
    
    
    
    


}


