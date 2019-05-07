//
//  InputControl.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 03/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputControl {
    
    static func convertStringtoInt(input: String) throws ->[Int]{
        var input = input
        
        if(input.first == "(") && (input.last == ")"){
            input.removeFirst()
            input.removeLast()
            let inputArray = input.components(separatedBy: ",").compactMap{Int($0)}
            
            for input in inputArray {
                if !(1...24).contains(input){
                    throw Error.wrongValue
                }
            }
            return inputArray
        }
        throw Error.removeValue
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



