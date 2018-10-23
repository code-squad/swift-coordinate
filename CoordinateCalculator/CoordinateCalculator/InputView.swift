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
    func readInput() -> (Int,Int){
        let rawInput = receiveInput(ment: "좌표를 입력하세요 (x,y)")
        return checkCoordinateForm(rawInput: rawInput)
    }
    
    // 멘트를 출력하고 값을 입력받음
    private func receiveInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    // 입력받은 값을 좌표 형식에 맞게 검사 후 반환, 틀린 값은 -1 반환
    private func checkCoordinateForm(rawInput: String) -> (Int,Int) {
        let pointElements = rawInput.trimmingCharacters(in: CharacterSet(charactersIn: "()")).split(separator: ",")
        if pointElements.count != 2 {
            return (-1,-1)
        }
        let numericElements = pointElements.compactMap {Int($0) ?? -1}
        return (numericElements[0], numericElements[1])
    }
    
    func checkWrongCoordinate(numbers: (Int,Int)) -> Bool {
        return numbers.0 < 0 || numbers.1 < 0
    }
}
