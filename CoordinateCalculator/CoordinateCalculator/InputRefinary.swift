//
//  Pair.swift
//  CoordinateCalculator
//
//  Created by hw on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    
    func seperatePointByPoint(for regex: String, in inputString: String) -> [String] {
        do {
            if let regex = try? NSRegularExpression(pattern: regex, options: .caseInsensitive){
                let test = regex.matches(in: inputString, options: [], range: NSRange(location:0, length: inputString.count))
                let result : [String] = test.map{ String(inputString[Range($0.range, in: inputString)!])}
                return result
            }
        }
        return []
    }
    
    func checkInvalidCharacterSet(for regex: String, in inputString: String) -> Bool {
        do {
            if let regex = try? NSRegularExpression(pattern: regex, options: .caseInsensitive){
                let test = regex.matches(in: inputString, options: [], range: NSRange(location:0, length: inputString.count))
                let result : [String] = test.map{ String(inputString[Range($0.range, in: inputString)!])}
                return result.count == 0 ? true : false
            }
        }
        return true
    }
}

struct InputRefinary {
    static private let MaxRange: Int = 24
    static private let MinRange: Int = 0
    private (set) var pointPair: [Pair] = [Pair]()
    
    init(_ input : String) throws{
        try InputRefinary.checkLineHasValidCharacterSet(input)
        let pointList: [String] = try InputRefinary.splitPointByPoint(input)
        for point in pointList {
            let (preprocessedX,preprocessedY) = try InputRefinary.splitPointXFromY(point)
            let (xPointDigit,yPointDigit) = try InputRefinary.convertStringToNumber(x: preprocessedX, y: preprocessedY)
            if !InputRefinary.isInRange(x: xPointDigit, y: yPointDigit) {
                throw ErrorCode.InvalidRange
            }
            pointPair.append (Pair(xPointDigit, yPointDigit))
        }
    }
    
    static private func splitPointByPoint(_ input: String) throws -> [String] {
        let numberFilter: String = "[0-9]{1,2}"
        let pointfilter: String = "(\\()\(numberFilter)(,)\(numberFilter)(\\))"
        let result = input.seperatePointByPoint(for: pointfilter, in: input)
            if result.count == 0 {
                throw ErrorCode.SplitStringError
            }
        return result
    }

    static private func checkLineHasValidCharacterSet(_ input: String) throws -> Void { 
        let invalidCharacterSetFilter: String = "[a-zA-Z `!@#$%^&*_+`=\\[\\]\\{\\}\\\\|]+"
        let invalidCharacterSet = input.checkInvalidCharacterSet(for: invalidCharacterSetFilter, in: input)
        if !invalidCharacterSet {
            throw ErrorCode.InvalidCharacter
        }
    }
    
    static private func splitPointXFromY (_ point: String) throws -> (String, String) {
        let splitAPairOfPoint: [String] = point.trimmingCharacters(in: ["(",")"])
            .split(separator: ",")
            .map { (value) in return String(value)}
        if splitAPairOfPoint.count != 2 {
            throw ErrorCode.SplitCoordinatorError
        }
        return (splitAPairOfPoint[0], splitAPairOfPoint[1])
    }
    
    static private func convertStringToNumber(x: String,  y: String)throws -> Pair {
        guard let pointX = Int(x) else{
            throw ErrorCode.IsNotANumber
        }
        guard let pointY = Int(y) else{
            throw ErrorCode.IsNotANumber
        }
        return Pair(pointX, pointY)
    }
    
    static private func isInRange(x: Int, y: Int)  -> Bool {
        if x > MaxRange || x < MinRange || y > MaxRange || y < MinRange  {
            return false
        }
        return true
    }
}
