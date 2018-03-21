//
//  Spliter.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Spliter{
    static func split(_ input:String) throws -> (Int,Int){
        let pattern = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
        

        guard matches.count != 0 else {
            throw CoordinateCalculatorError.invalidFormat
        }

        let replacedInput = regex.stringByReplacingMatches(in: input,
                                                         options: [],
                                                         range: NSRange(location: 0, length: input.count),
                                                         withTemplate: "$1,$2")

        let separatedInput = replacedInput.split(separator: ",")
        

        guard let xOfInput = Int(separatedInput[0].description), let yOfInput = Int(separatedInput[1].description) else {
            throw CoordinateCalculatorError.invalidValue
        }
        
        return (xOfInput, yOfInput)
    }
}
