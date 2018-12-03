//
//  InputView.swift
//  coordinateCalculator
//
//  Created by JINA on 27/11/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

struct InputView {
    //좌표를 입력받고 콤마를 기준으로 나누어 문자열 배열을 만듦
    static func readInput() -> [String] {
        print("좌표를 입력하세요 (x,y)")
        let input = readLine()?.components(separatedBy: ",")
        return input!
    }
    
    //콤마로 나눈 문자열 배열을 숫자와 문자를 분리 하고 숫자 배열을 만듦
    static func separateValue(_ input: [String]) -> MyPoint {
        var firVal = 0
        var secVal = 0
        if input[0].contains("(") && input[1].contains(")") {
            firVal = Int(input[0].trimmingCharacters(in: CharacterSet.decimalDigits.inverted))!
            secVal = Int(input[1].trimmingCharacters(in: CharacterSet.decimalDigits.inverted))!
        } else {
            print("(x,y) 형식으로 입력해주세요")
            readInput()
        }
        return MyPoint.init([firVal,secVal])
    }    
}
