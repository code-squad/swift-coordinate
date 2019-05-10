//
//  InputControl.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 03/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputValidator {
    
    static func convertStringtoInt(input: String) throws ->[Int] {
        var input = input
        
        if(input.first == "(") && (input.last == ")"){
            input.removeFirst()
            input.removeLast()

            let inputArray = input.components(separatedBy: ",").compactMap{Int($0)}
            
            for input in inputArray {
                try validateRange(number: input)
            }
            return inputArray
        }
        throw Error.removeValue
    }
    
    
   static func validateRange(number: Int) throws {
        if !(1...24).contains(number){
            throw Error.wrongValue
        }
    }
    
    
    enum Error: Swift.Error {
        case wrongValue
        case removeValue
        var description: String {
            switch self {
            case .wrongValue: return "24까지의 좌표값만 입력해주세요"
            case .removeValue: return "(,)으로 값을 입력해주세요)"
            }
        }
    }
}

