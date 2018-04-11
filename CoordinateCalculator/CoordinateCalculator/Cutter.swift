//
//  Cutter.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 커터 구조체
struct Cutter {
    
    
    /// 문자열과 정규식을 받아서 정규식에 맞는 문자열 배열로 리턴
    private func cuttingLattersFrom(originLatters : String, regex : NSRegularExpression) -> Array<String>{
        let originForRange = originLatters as NSString
        return regex.matches(in : originLatters, options: [], range: NSRange(location : 0 , length : originForRange.length)).map{
            originForRange.substring(with: $0.range)
        }
    }
    
    /// 정규식용 문자열과 대상문자열을 받아서 정규식화 시킨 배열을 리턴
    func regexedFrom(wannaBeRegex : String,originLatters : String)->Array<String>?{
        guard let regex = makeRegexForm(regexTry: wannaBeRegex) else {
            return nil
        }
        return cuttingLattersFrom(originLatters: originLatters, regex: regex)
    }
    
    ///정규식을 통과한 한 덩이를 받아서 좌표 구조체 형태로 리턴
    //func 
    
}
