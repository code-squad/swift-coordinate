//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func readInput() -> String {
        print("좌표를 입력하세요.")
        if let inputCoordinate = readLine() {
            return inputCoordinate
        }
        return ""
    }
    
    func checkCountOfInputValue(inputValue: String) throws -> MyShape {
        let hasDash = CharacterSet.init(charactersIn: "-")
        var coordinateValue: [String] = []
        var points: [MyPoint] = []
        var myShape: MyShape
        if (inputValue.rangeOfCharacter(from: hasDash) != nil) {
            coordinateValue = inputValue.split(separator: "-").map(String.init)
        }else {
            coordinateValue = [inputValue]
        }
        do {
            try points = separateEachCoordinate(coordinateValue: coordinateValue)
        } catch CoordinateError.inputValuesOfLineError {
            print("두 개의 입력값 형식 에러")
        }
        if points.count == 1 {
            myShape = MyPoint(x: points[0].x, y: points[0].y)
        }else if points.count == 2 {
            myShape = MyLine(pointA: MyPoint(x: points[0].x, y: points[0].y), pointB: MyPoint(x: points[1].x, y: points[1].y)) as! MyShape
        }
        return myShape
    }
    
    func separateEachCoordinate(coordinateValue: [String]) throws -> [MyPoint] {
        var points: [MyPoint] = []
        for value in coordinateValue {
            do {
                try points.append(separateCoordinateNumber(inputValue: value))
            } catch CoordinateError.noCommaError {
                print("콤마가 없음")
            } catch CoordinateError.noBracketError {
                print("괄호가 없음")
            } catch CoordinateError.theRestError {
                print("그 외의 에러")
            }
        }
        return points
    }
    
    func separateCoordinateNumber(inputValue: String) throws -> MyPoint {
        let hasBracket = CharacterSet.init(charactersIn: "()")
        let hasComma = CharacterSet.init(charactersIn: ",")
        if (inputValue.rangeOfCharacter(from: hasBracket) != nil) {
            let rangeOfNumber = inputValue.index(after: inputValue.startIndex)..<inputValue.index(before: inputValue.endIndex)
            if (inputValue.rangeOfCharacter(from: hasComma) != nil) {
                do {
                    return try separateByComma(rangeOfNumber: String(inputValue[rangeOfNumber]))
                } catch CoordinateError.inputValueError {
                    print("입력값 형식 에러")
                } catch CoordinateError.outOfAvailableInputValue {
                    print("입력값 범위 에러")
                }
            }else {
                throw CoordinateError.noCommaError
            }
        }else {
            throw CoordinateError.noBracketError
        }
        throw CoordinateError.theRestError
    }
    
    func separateByComma(rangeOfNumber: String) throws -> MyPoint {
        var myPoint = MyPoint(x: 0, y: 0)
        let values = rangeOfNumber.split(separator: ",").flatMap({Int($0)})
        if values.count != 2 {
            throw CoordinateError.inputValueError
        }else {
            myPoint.x = values[0]
            myPoint.y = values[1]
            if myPoint.x > 24 || myPoint.y > 24 {
                throw CoordinateError.outOfAvailableInputValue
            }
        }
        return myPoint
    }
}
