//
//  extractter.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 커터 구조체
struct Extracter {
    /// 문자열과 정규식을 받아서 정규식에 맞는 문자열 배열로 리턴
    private func extractLettersFrom(originLatters : String, regex : NSRegularExpression) -> Array<String>{
        let originForRange = originLatters as NSString
        return regex.matches(in : originLatters, options: [], range: NSRange(location : 0 , length : originForRange.length)).map{
            originForRange.substring(with: $0.range)
        }
    }
    
    /// 문자열을 받아서 숫자부분만 문자배열로 리턴
    static func extractNumbersFrom(originLatters : String) -> Array<String>?{
        guard let numberRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forNumberCheck) else {
            return nil
        }
        return extractLettersFrom(originLatters: originLatters, regex: numberRegexForm)
    }
    
    /// 문자열을 받아서 좌표부분만 문자배열로 리턴
    static func extractPointFrom(originLatters : String) -> Array<String>?{
        guard let PointRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forPointCheck) else {
            return nil
        }
        return extractLettersFrom(originLatters: originLatters, regex: PointRegexForm)
    }
    
    /// 문자열을 받아서 라인부분만 문자배열로 리턴
    static func extractLineFrom(originLatters : String) -> Array<String>?{
        guard let lineRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forLineCheck) else {
            return nil
        }
        return extractLettersFrom(originLatters: originLatters, regex: lineRegexForm)
    }
