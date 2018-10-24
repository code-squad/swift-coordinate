//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

class InputView {
    
    //값을 입력 받은 후 검사&가공하여 출력
    func readInput() -> [Int]{
        // 값 입력받음
        let rawInput = receiveInput(ment: "좌표를 입력하세요 (x,y)")
        var numberInput = numerizeInput(rawInput: rawInput)
        // 입력 형식 확인 후 틀리면 재귀 호출
        if checkWrongForm(inputNumbers: numberInput) {
            print("입력 형식은 (x,y)입니다")
            numberInput = readInput()
        }
        // 값 범위 확인 후 틀리면 재귀 호출
        if checkWrongRange(inputNumbers: numberInput) {
            print("입력 범위는 0=<x<25, 0=<y<25 입니다")
            numberInput = readInput()
        }
        return numberInput
    }
    
    // 멘트를 출력하고 값을 입력받음
    private func receiveInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    //입력받은 값을 숫자로 바꿔 배열로 반환
    private func numerizeInput(rawInput: String) -> [Int] {
        let pointElements = rawInput.trimmingCharacters(in: CharacterSet(charactersIn: "()")).split(separator: ",")
        let numericElements = pointElements.compactMap {Int($0) ?? -1}
        return numericElements
    }
    
    // 입력받는 값이 형식에 맞는지 검사
    func checkWrongForm(inputNumbers: [Int]) -> Bool {
        return inputNumbers.count != 2
    }
    
    // 입력받는 값이 범위에 맞는지 검사
    func checkWrongRange(inputNumbers: [Int]) -> Bool {
        for number in inputNumbers {
            if number < 0 || number > 24 {return true}
        }
        return false
    }
    
    
}

