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
        print("다시 입력해주세요. 좌표값 형태가 아닙니다. ")
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
    
    private func checkOneLimit (point : MyPoint) -> Bool {
        return point.x <= 24 && point.y <= 24
    }
    
    func checkLimitCondition(coordinates : [MyPoint]) -> Bool {
        var limitVal : Bool = true
        for index in 0..<coordinates.count {
            if checkOneLimit(point: coordinates[index]) == false {
                limitVal = false
            }
        }
        if limitVal == false {
            print("다시 입력해주세요. X 또는 Y가 24보다 큰 값이 있습니다.")
            return false
        }
        return true
    }
    
    func selectShape(points : [MyPoint]) -> MyShape {
        switch points.count {
        case 2:
            let line : MyShape = MyShape.init(pointsOfline: points)
            return line
        default:
            let point : MyShape = MyShape.init(point: points)
            return point
        }
    }
    
    func seperateCoordinates (userInput : String) -> [MyPoint] {
        let temp : [String] = userInput.split(separator: "-").map(String.init)
        var coordinates : [MyPoint] = []
        for indexOfCoordinate in 0..<temp.count {
            coordinates.append(seperateOneCoordinate(oneCoordinate: temp[indexOfCoordinate]))
        }
        return coordinates
    }
    
    private func seperateOneCoordinate (oneCoordinate : String) -> MyPoint {
        var coordinates : [Int] = []
        let userInputWithoutLeftBracket = sliceMark(oneCoordinate, mark: "(")
        let userInputWithoutRightBracket = sliceMark(userInputWithoutLeftBracket, mark: ")")
        
        var temp = userInputWithoutRightBracket.split(separator: ",").map(String.init)
        for index in 0..<temp.count {
            coordinates.append(Int(temp[index]) ?? 0)
        }
        return MyPoint.init(coordinates)
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
