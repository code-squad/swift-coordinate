//
//  Spliter.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum SpliterError:Error{
    case invalidValue
    case invalidFormat
}

extension SpliterError:LocalizedError {
    public var errorDescription:String? {
        switch self {
        case .invalidValue:
            return "유효하지 않은 값입니다."
        case .invalidFormat:
            return "유효하지 않은 형식입니다."
        }
    }
}


struct Spliter{
    static func split(_ input:String) throws -> Points{
        let pattern = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
        

        guard matches.count != 0 else {
            throw SpliterError.invalidFormat
        }

        let replacedInput = regex.stringByReplacingMatches(in: input,
                                                         options: [],
                                                         range: NSRange(location: 0, length: input.count),
                                                         withTemplate: "$1,$2")

        let separatedInputIntoPoint = replacedInput.split(separator: "-")
        
        var points:Points = []
        
        for index in 0..<separatedInputIntoPoint.count {
            let separedInputIntoCoordinate = separatedInputIntoPoint[index].split(separator: ",")
            guard let xOfInput = Int(separedInputIntoCoordinate[0].description), let yOfInput = Int(separedInputIntoCoordinate[1].description) else {
                throw SpliterError.invalidValue
            }
            points.append((xOfInput,yOfInput))
        }
        return points
    }
}
