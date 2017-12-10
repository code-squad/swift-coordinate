//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput() {
        print("실행 좌표를 입력하세요.")
        print("*Ex) (10,10)")
        print("* X,Y좌표의 최댓값은 24입니다.")
        let userCoordinate = readLine()
        guard let input = userCoordinate else {
            return
        }
        print(seperateCoordinates(userInput: input))
    }
    
    func seperateCoordinates (userInput : String) -> [Int] {
        var coordinates : [Int] = [0,0]
        let userInputWithoutLeftBracket = sliceMark(userInput, mark: "(")
        let userInputWithoutRightBracket = sliceMark(userInputWithoutLeftBracket, mark: ")")
        
        var temp = userInputWithoutRightBracket.split(separator: ",").map(String.init)
        for index in 0..<temp.count {
            coordinates[index] = Int(temp[index]) ?? 0
        }
        return coordinates
    }
    
    func sliceMark (_ fullString : String, mark : Character) -> String {
        var temp = ""
        let StringsWithoutMark : [String] = fullString.split(separator: mark).map(String.init)
        for index in 0..<StringsWithoutMark.count {
            temp += StringsWithoutMark[index]
        }
        return temp
    }
}
