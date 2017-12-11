//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput() -> String {
        print("좌표를 입력하세요.")
        let userCoordinate = readLine()
        guard let input = userCoordinate else {
            return ""
        }
        return input
    }
    //입력 문자열에서 하나의 문자를 제거하고, 그 문자열을 반환하는 함수
    func sliceMark (_ fullString : String, mark : Character) -> String {
        var temp = ""
        let StringsWithoutMark : [String] = fullString.split(separator: mark).map(String.init)
        for index in 0..<StringsWithoutMark.count {
            temp += StringsWithoutMark[index]
        }
        return temp
    }
    //입력받은 문자열에서 좌표를 반환해주는 함수
    func seperateCoordinates (userInput : String) -> MyPoint {
        var coordinates : [Int] = [0,0]
        let userInputWithoutLeftBracket = sliceMark(userInput, mark: "(")
        let userInputWithoutRightBracket = sliceMark(userInputWithoutLeftBracket, mark: ")")
        
        var temp = userInputWithoutRightBracket.split(separator: ",").map(String.init)
        for index in 0..<temp.count {
            coordinates[index] = Int(temp[index]) ?? 0
        }
        let userPoints : MyPoint = MyPoint.init(x: coordinates[0], y: coordinates[1])
        return userPoints
    }

}
