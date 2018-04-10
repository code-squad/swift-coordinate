//
//  Cutter.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
func k(){
    let testStr = ANSICode.axis.draw()
    let axisDrawPattern = "([0-9]{1,2});([0-9]{1,2})"
    
    if let regex = try? NSRegularExpression(pattern: axisDrawPattern, options: []) {
        let testNSStr = testStr as NSString
        let matches2 = regex.matches(in : testStr, options: [], range: NSRange(location : 0 , length : testNSStr.length))
        let result2 = matches2.map {
            testNSStr.substring(with: $0.range)
        }
        print(result2)
    }
    else {
        print("정규식 작성 실패!")
    }
}
/// 커터 구조체
struct Cutter {
    
    ///입력한 문자열로 정규식을 만들어주는 함수
    func makeRegexFrom(regexTry : String)->NSRegularExpression?{
        guard let regex = try? NSRegularExpression(pattern: regexTry, options: []) else {
            return nil
        }
        return regex
    }
    
    /// 문자열과 정규식을 받아서 정규식에 맞는 문자열 배열로 리턴 
    func cuttedLattersFrom(originLatters : String, regex : NSRegularExpression) -> Array<String>{
        let originForRange = originLatters as NSString
        return regex.matches(in : originLatters, options: [], range: NSRange(location : 0 , length : originForRange.length)).map{
            originForRange.substring(with: $0.range)
        }
    }
    
}
