//
//  Cutter.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
ß
/// 커터 구조체
struct Cutter {
    
    /// 입력한 문자열로 정규식을 만들어주는 함수
    private func makeRegexForm(regexTry : String)->NSRegularExpression?{
        guard let regex = try? NSRegularExpression(pattern: regexTry, options: []) else {
            print("잘못된 정규식 표현입니다")
            return nil
        }
        return regex
    }
    
    /// 문자열과 정규식을 받아서 정규식에 맞는 문자열 배열로 리턴
    private func cuttingLattersFrom(originLatters : String, regex : NSRegularExpression) -> Array<String>{
        let originForRange = originLatters as NSString
        return regex.matches(in : originLatters, options: [], range: NSRange(location : 0 , length : originForRange.length)).map{
            originForRange.substring(with: $0.range)
        }
    }
    
    /// 정규식용 문자열과 대상문자열을 받아서 정규식화 시킨 배열을 리턴
    func makeRegexFrom(wannaBeRegex : String,originLatters : String)->Array<String>?{
        guard let regex = makeRegexForm(regexTry: wannaBeRegex) else {
            return nil
        }
        return cuttingLattersFrom(originLatters: originLatters, regex: regex)
    }
    
}
