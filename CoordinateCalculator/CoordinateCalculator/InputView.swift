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
    
    func checkCountOfInputValue(inputValue: String) {
        let hasDash = CharacterSet.init(charactersIn: "-")
        var coordinateValue: [String]
        if (inputValue.rangeOfCharacter(from: hasDash) != nil) {
            coordinateValue = inputValue.split(separator: "-").map(String.init)
            print("두개의 좌표")
            print(coordinateValue[0],coordinateValue[1])
        }else {
            coordinateValue = [inputValue]
            print("한개의 좌표")
        }
    }

    func separateEachCoordinate(inputValue: String) throws -> MyPoint {
        
        for value in coordinateValue {
            do {
                if coordinateValue.count == 1 {
                    return try separateCoordinateNumber(inputValue: value)
                }else {
                    
                }
            } catch CoordinateError.noCommaError {
                print("콤마가 없음")
            } catch CoordinateError.noBracketError {
                print("괄호가 없음")
            } catch CoordinateError.theRestError {
                print("그 외의 에러")
            }
        }
        throw CoordinateError.inputValuesOfLineError
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
