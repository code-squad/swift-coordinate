//
//  InputControl.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 03/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Validator {
    
    func validateFormat(input: String) throws -> [Int] {
        var validateTarget = input 
        
        guard (validateTarget.first == "(" && validateTarget.last == ")" ) else { throw Error.wrongValue }
        validateTarget.removeFirst()
        validateTarget.removeLast()
        let points = validateTarget.split(separator: ",").map {String($0)}
        let convertPointstoInt = try points.map { (point: String) -> Int in
            guard let point = Int(point) else {
                throw Error.notIntValue
            }
            return point
        }
        return convertPointstoInt
    }
    
    func validateRange(number: Int) throws {
        if !(1...24).contains(number){
            throw Error.wrongValue
        }
    }
    
    enum Error: Swift.Error {
        case wrongValue
        case removeValue
        case notIntValue
        
        var description: String {
            switch self {
            case .wrongValue: return "24까지의 좌표값만 입력해주세요"
            case .removeValue: return "(,)으로 값을 입력해주세요)"
            case .notIntValue: return "숫자로 입력해주세요"
            }
        }
    }
}

