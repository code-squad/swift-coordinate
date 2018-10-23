//
//  CheckUserInput.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    // 스트링의 첫번째 문자 리턴
    func getFirstElement() -> Character{
        let firstIndex = self.index(self.startIndex, offsetBy: 0)
        return self[firstIndex]
    }
    
    // 스트링의 마지막 문자 리턴
    func getLastElement() -> Character{
        let endIndex = self.index(self.endIndex, offsetBy: -1)
        return self[endIndex]
    }
}

struct CheckUserInput {
    var input : String
    
    // 입력 값의 오류를 검사하여 오류 내용을 리턴
    mutating func checkErrorState(input: String) -> ErrorState{
        self.input = input
        guard IsPossibleInputCharacter() else { return .outOfRangeCharacter }
        guard IsRightOrderInput() else { return .wrongOrder }
        guard IsOverFlowNumber() else { return .overFlowNumber }
        return .rightInput
    }
    
    // CharacterSet에 맞지 않는 입력인지 검사
    private func IsPossibleInputCharacter() -> Bool{
        let possibleInputSet = CharacterSet.init(charactersIn: "0123456789(,)")
        for element in self.input{
            guard String(element).rangeOfCharacter(from: possibleInputSet) != nil else { return false}
        }
        return true
    }
    
    // 입력 형태가 (x,y)인지 검사
    private func IsRightOrderInput() -> Bool{
        guard self.input.getFirstElement() == "(" && self.input.getLastElement() == ")" && self.input.contains(",") else { return false }
        let splitInput : [String] = self.input.components(separatedBy: ["(", ")", ","])
        guard Int(splitInput[1]) != nil && Int(splitInput[2]) != nil else { return false }
        return true
    }
    
    // 범위를 초과하였는지 검사
    private func IsOverFlowNumber() -> Bool{
        let splitInput : [String] = self.input.components(separatedBy: ["(", ")", ","])
        guard let positionX = Int(splitInput[1]) else { return false }
        guard let positionY = Int(splitInput[2]) else { return false }
        guard positionX <= 24 && positionX >= 0 && positionY <= 24 && positionY >= 0 else { return false }
        return true
    }
}
