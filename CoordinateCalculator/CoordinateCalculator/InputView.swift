//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

class InputView {
    
    //값을 입력 받은 후 가공하여 출력
    static func readInput() -> [Int]{
        let rawInput = receiveInput(ment: "좌표를 입력하세요 (x,y)")
        let numericInput = makeNumericArrayBy(rawInput: rawInput)
        return numericInput
    }
    
    // 멘트를 출력하고 값을 입력받음
    private static func receiveInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    //입력받은 값을 숫자로 바꿔 배열로 반환
    private static func makeNumericArrayBy(rawInput: String) -> [Int] {
        let pointElements = rawInput.trimmingCharacters(in: CharacterSet(charactersIn: "()")).split(separator: ",")
        let numericElements = pointElements.compactMap {Int($0) ?? -1}
        return numericElements
    }
    
}

