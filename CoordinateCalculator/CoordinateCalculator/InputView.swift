//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    //입력가능한 CharacterSet : "(", ")", ",", "-", "숫자"
    let validCharacters = CharacterSet.init(charactersIn: "(),-").union(CharacterSet.decimalDigits)
    
    //가능한 문자인지 확인
    func checkValidCharacters (userInput : String) -> Bool {
        let inValidCharacters = userInput.components(separatedBy: validCharacters).filter { $0 != "" }
        if inValidCharacters.count == 0 {
            return true
        }
        return false
    }
    
    func readInput() -> String {
        print("좌표를 입력하세요. 종료를 원하시면 q를 입력해주세요.")
        let userCoordinate = readLine()
        guard let input = userCoordinate else {
            return ""
        }
        return input
    }
    
    func checkLimitCondition(coordinates : [[Int]]) -> Bool {
        for oneCoordinate in coordinates {
                return checkOneLimit(point: oneCoordinate) == true
            }
        return false
    }
    
    private func checkOneLimit (point : [Int]) -> Bool {
        return point[0] <= 24 || point[1] <= 24
    }
    
    func seperateCoordinates (userInput : String) -> [[Int]] {
        let temp : [String] = userInput.split(separator: "-").map(String.init)
        var coordinates : [[Int]] = Array(repeatElement([0,0], count: temp.count))
        for indexOfCoordinate in 0..<temp.count {
            coordinates[indexOfCoordinate] = seperateOneCoordinate(oneCoordinate: temp[indexOfCoordinate])
        }
        return coordinates
    }
    
    private func seperateOneCoordinate (oneCoordinate : String) -> [Int] {
        var coordinates : [Int] = [0,0]
        let userInputWithoutLeftBracket = sliceMark(oneCoordinate, mark: "(")
        let userInputWithoutRightBracket = sliceMark(userInputWithoutLeftBracket, mark: ")")
        
        var temp = userInputWithoutRightBracket.split(separator: ",").map(String.init)
        for index in 0..<temp.count {
            coordinates[index] = Int(temp[index]) ?? 0
        }
        
        return coordinates
    }
    
    private func sliceMark (_ fullString : String, mark : Character) -> String {
        var temp = ""
        let stringsWithoutMark : [String] = fullString.split(separator: mark).map(String.init)
        for index in 0..<stringsWithoutMark.count {
            temp += stringsWithoutMark[index]
        }
        return temp
    }
}
