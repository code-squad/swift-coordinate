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
    private func extractNumbersFrom(originLatters : String) -> Array<String>?{
        guard let numberRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forNumberCheck) else {
            return nil
        }
        return extractLettersFrom(originLatters: originLatters, regex: numberRegexForm)
    }
    
    /// 문자열을 받아서 좌표부분만 문자배열로 리턴
    private func extractPointFrom(originLatters : String) -> Array<String>?{
        guard let PointRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forPointCheck) else {
            return nil
        }
        return extractLettersFrom(originLatters: originLatters, regex: PointRegexForm)
    }
    
    /// 문자열을 받아서 라인부분만 문자배열로 리턴
    private func extractLineFrom(originLatters : String) -> Array<String>?{
        guard let lineRegexForm = RegexFormMaker.makeRegexForm(regexTry: Regex.forLineCheck) else {
            return nil
        }
        return extractLettersFrom(originLatters: originLatters, regex: lineRegexForm)
    }
    
    /// 좌표값 한개를 받아서 정규식화 해서 배열로 리턴
    func extractPointFrom(userPoint:String)->Array<String>?{
        // 받은 유저 입력을 정규식화
        guard let regexedPoint = extractPointFrom(originLatters: userPoint) else {
            return nil
        }
        // 정규식을 통과 못하면 nil 리턴
        guard regexedPoint.count > 0 else {
            print("잘못된 좌표입니다.")
            return nil
        }
        //마이포인트 형태로 리턴. 앞에서 두자리인지 체크 완료했음
        return regexedPoint
    }
