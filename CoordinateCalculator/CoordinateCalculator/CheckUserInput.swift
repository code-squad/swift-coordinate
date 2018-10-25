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
    
    mutating func setinput(_ input: String){
        self.input = input
    }
    
    // 입력에 대한 Error 내역을 검사한다
    func checkErrorState() -> CheckInputState{
        if IsShapeOrPoint() {                                                              // "-"이 있는 경우
            for point in input.split(separator: "-").map(String.init){
                guard checkPoint(point) == .rightInput else { return checkPoint(point) }
            }
            return .rightInput
        }
        else { return checkPoint(self.input) }                                             // "-"이 없는 경우
    }
    
    // "-"이 포함되어 있는지 검사
    private func IsShapeOrPoint() -> Bool {
        guard input.contains("-") else { return false }
        return true
    }
    
    // 포인트에 대해 오류를 검사하여 오류 내용 리턴
    func checkPoint(_ point: String) -> CheckInputState{
        guard IsPossibleInputCharacter(point) else { return .outOfRangeCharacter }
        guard IsRightOrderInput(point) else { return .wrongOrder }
        guard IsOverFlowNumber(point) else { return .overFlowNumber }
        return .rightInput
    }
    
    // CharacterSet에 포함되지 않는 입력인지 검사
    private func IsPossibleInputCharacter(_ point: String) -> Bool{
        let possibleInputSet = CharacterSet.init(charactersIn: "0123456789(,)")
        if point == "" { return false }
        for element in point{
            guard String(element).rangeOfCharacter(from: possibleInputSet) != nil else { return false }
        }
        return true
    }
    
    // 입력 형태가 (x,y)인지 검사
    private func IsRightOrderInput(_ point: String) -> Bool{
        guard point.getFirstElement() == "(" && point.getLastElement() == ")" && point.contains(",") else { return false }
        let splitInput : [String] = point.components(separatedBy: ["(", ")", ","])
        guard Int(splitInput[1]) != nil && Int(splitInput[2]) != nil else { return false }
        return true
    }
    
    // 범위를 초과하였는지 검사
    private func IsOverFlowNumber(_ point: String) -> Bool{
        let splitInput : [String] = point.components(separatedBy: ["(", ")", ","])
        guard let positionX = Int(splitInput[1]) else { return false }
        guard let positionY = Int(splitInput[2]) else { return false }
        guard positionX <= 24 && positionX >= 0 && positionY <= 24 && positionY >= 0 else { return false }
        return true
    }
}
