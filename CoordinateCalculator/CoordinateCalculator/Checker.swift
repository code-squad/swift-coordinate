//
//  Checker.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Checker {
    static func checkRegexedInput(userInput:String)->Bool{
        guard let regexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forInputCheck) else {
            return false
        }
        let regexedUserInput = Cutter.cuttingLattersFrom(originLatters: userInput, regex: regexForm)
        guard regexedUserInput.count > 0 else {
            return false
        }
        return true
    }
}
