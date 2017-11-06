//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var inputCoordinateValue: String = ""
    private let validCharacterSet: Set<Character> = ["0","1","2","3","4",
                                                     "5","6","7","8","9",
                                                     "(",")",",","-"]
    
    mutating func readInput() throws {
        print("좌표를 입력하세요.")
        let inputData = readLine()
        guard let inputCoordinateValue = inputData else {
            print("다시입력해주세요.")
            return
        }
        if divideAndInterSection(inputCoordinateValue) {
            print("입력가능한 문자는 ( , ) - 와 0~9인 숫자입니다. :)")
            throw InputViewError.invalidCharacterSet
        }
        self.inputCoordinateValue = inputCoordinateValue
    }
    
    //입력가능한 CharacterSet과 입력 value를 교집합한 갯수가 value각각의 갯수보다 작으면 입력가능한 셋에 없는 캐릭터가 있어서 오류전달.
    func divideAndInterSection(_ value: String) -> Bool {
        var disassembleValue: [Character] = []
        for valueIndex in 0..<value.count {
            disassembleValue.append(value[value.index(value.startIndex, offsetBy: valueIndex)])
        }
        let disassembleSetOfValue: Set<Character> = Set(disassembleValue)
        let checkValueSet = validCharacterSet.isDisjoint(with: disassembleSetOfValue)
        return checkValueSet
    }
    
    mutating func extract() throws -> MyPoint {
        var dotPoint: MyPoint = MyPoint()
        inputCoordinateValue.remove(at: inputCoordinateValue.startIndex)
        inputCoordinateValue.remove(at: inputCoordinateValue.index(before: inputCoordinateValue.endIndex))
        let separateAxisValue = inputCoordinateValue.components(separatedBy: ",").flatMap{ Int($0) }
        if confirm(points: separateAxisValue) {
            dotPoint.x = separateAxisValue[0]
            dotPoint.y = separateAxisValue[1]
            return dotPoint
        }
        throw InputViewError.invalidPoint
    }
    
    private func confirm(points: [Int]) -> Bool {
        if points.isEmpty || points.count == 1{
            print("다시입력해주세요. 괄호안에는 정수가 와야합니다. :)")
            return false
        }
        for index in 0...1 {
            if points[index] < 0 || points[index] > 24 {
                print("x,y 값은 0 <= x,y <= 24 합니다. :) 다시입력해주세요.")
                return false
            }
        }
        return true
    }
    
}
