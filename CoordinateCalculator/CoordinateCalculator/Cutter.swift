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
    
    
    
    ///정규식으로 만들어주는 함수
    func makeRegexFrom(regexTry : String)->NSRegularExpression?{
        guard regex = try? NSRegularExpression(pattern: regexTry, options: []) else {
            return nil
        }
        return regex
    }
    
    
}
