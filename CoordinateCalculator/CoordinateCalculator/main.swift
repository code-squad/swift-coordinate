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
    let regex = try! NSRegularExpression(pattern: axisDrawPattern, options: [])
    let matches = regex.matches(in : testStr, options: [], range: NSRange(testStr.startIndex..., in: testStr))
//    print(matches.count)
    let result = matches.map {
        String(testStr[Range($0.range, in: testStr)!])
    }
    print(result)
}

main()
