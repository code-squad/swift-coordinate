//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private let validCharacterSet: Set<Character> = ["0","1","2","3","4",
                                                     "5","6","7","8","9",
                                                     "(",")",",","-"]
    
    func readInput(_ pointModel: CoordinateModel) throws {
        print("좌표를 입력하세요.")
        let inputPoints = readLine()
        guard let inputCoordinateValue = inputPoints else {
            print("다시입력해주세요.")
            return
        }
        if divide(inputCoordinateValue) {
            print("입력가능한 문자는 ( , ) - 와 0~9인 숫자입니다. :)")
            throw InputViewError.invalidCharacterSet
        }
        pointModel.inputCoordinateValue = inputCoordinateValue
    }
    
    // 입력된 값을 쪼개어 Set<Character>로 변환후 isDisjoint 메소드를 이용하여 입력가능한 Set인지 구별한다.
    // validCharacterSet에 포함된 값이라면 false 를 반환하는 메소드다.
    private func divide(_ value: String) -> Bool {
        var disassembleValue: [Character] = []
        for valueIndex in 0..<value.count {
            disassembleValue.append(value[value.index(value.startIndex, offsetBy: valueIndex)])
        }
        let disassembleSetOfValue: Set<Character> = Set(disassembleValue)
        let checkValueSet = validCharacterSet.isDisjoint(with: disassembleSetOfValue)
        return checkValueSet
    }
    
}
