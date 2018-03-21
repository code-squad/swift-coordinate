//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputViewError:Error {
    case invalidValue
    case invalidFormat
}

struct InputView{
    
    static func readInput() throws -> String {
        print("좌표를 입력하세요.")

        guard let rawInput = readLine(), !rawInput.isEmpty else {
           throw InputViewError.invalidValue
        }
        
        return rawInput
//
//        checkquit(rawInput)
//
//        let pattern = "\\(([0-9]|1[0-9]|2[0-4]),([0-9]|1[0-9]|2[0-4])\\)"
//        let regex = try! NSRegularExpression(pattern: pattern, options: [])
//        let matches = regex.matches(in: rawInput, options: [], range: NSRange(location: 0, length: rawInput.count))
//
//        guard matches.count != 0 else {
//            throw InputViewError.invalidFormat
//        }
//
//        let replacedInput = regex.stringByReplacingMatches(in: rawInput,
//                                                         options: [],
//                                                         range: NSRange(location: 0, length: rawInput.count),
//                                                         withTemplate: "$1,$2")
//
//        let separatedInput = replacedInput.split(separator: ",")
//
//        guard let xOfInput = Int(separatedInput[0].description), let yOfInput = Int(separatedInput[1].description) else {
//            throw InputViewError.invalidValue
//        }
//
//        return MyPoint(x: xOfInput, y: yOfInput)
    }
    
}
