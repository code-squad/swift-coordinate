//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    ///OutputView 구조체 선언
    let testStr = ANSICode.axis.draw()
    let axisDrawPattern = "([0-9]{1,2});([0-9]{1,2})"
    do {
        let regex = try NSRegularExpression(pattern: axisDrawPattern, options: [])
        let matches = regex.matches(in : testStr, options: [], range: NSRange(testStr.startIndex..., in: testStr))
        let result = matches.map {
            String(testStr[Range($0.range, in: testStr)!])
        }
        let testNSStr = testStr as NSString
        let matches2 = regex.matches(in : testStr, options: [], range: NSRange(location : 0 , length : testNSStr.length))
        let result2 = matches2.map {
            testNSStr.substring(with: $0.range)
        }
        print(result2)
    } catch {
        print("정규식 작성 실패!")
    }
    
    
    
}

main()
