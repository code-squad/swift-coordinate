//
//  MyShapeCreator.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyShapeCreator {
    enum CoordinateError: Error {
        case noComma
        case noBracket
        case inputValue
        case theRest
        case outOfAvailableInputValue
        case inputValuesOfLine
        case noRectangle
    }
    
    func createMyShape(inputValue: String) throws -> MyShape {
        let hasDash = CharacterSet.init(charactersIn: "-")
        var coordinateValue: [String] = []
        var points: [MyPoint] = []
        if inputValue.rangeOfCharacter(from: hasDash) != nil {
            coordinateValue = inputValue.split(separator: "-").map(String.init)
        }else {
            coordinateValue = [inputValue]
        }
        do {
            try points = separateEachCoordinate(coordinateValue: coordinateValue)
        } catch CoordinateError.inputValuesOfLine {
            print("두 개의 입력값 형식 에러")
        }
        
        if points.count == 1 { // point
            return MyPoint(x: points[0].x, y: points[0].y)
        }else if points.count == 2 { // line
            return MyLine(pointA: MyPoint(x: points[0].x, y: points[0].y), pointB: MyPoint(x: points[1].x, y: points[1].y))
        }else if points.count == 3 { // Triangle
            return MyTriangle(pointA: MyPoint(x: points[0].x, y: points[0].y), pointB: MyPoint(x: points[1].x, y: points[1].y), pointC: MyPoint(x: points[2].x, y: points[2].y))
        }else if points.count == 4 { // Rectangle
            guard checkRectangle(points: points) else {
                throw CoordinateError.noRectangle
            }
            let size = CGSize(width: MyLine(pointA: points[0], pointB: points[1]).calculateOfLength(), height: MyLine(pointA: points[1], pointB: points[2]).calculateOfLength())
            return MyRect(origin: points[0], size: size)
        }
        throw CoordinateError.theRest
    }
    
    func checkRectangle(points: [MyPoint]) -> Bool {
        let d = MyLine(pointA: points[0], pointB: points[2]).calculateOfLength()
        let pythagoras = sqrt(pow(MyLine(pointA: points[0], pointB: points[1]).calculateOfLength(),2) +  pow(MyLine(pointA: points[1], pointB: points[2]).calculateOfLength(),2))
        guard d == pythagoras else{
            return false
        }
        return true
    }
    
    func separateEachCoordinate(coordinateValue: [String]) throws -> [MyPoint] {
        var points: [MyPoint] = []
        for value in coordinateValue {
            do {
                try points.append(separateCoordinateNumber(inputValue: value))
            } catch CoordinateError.noComma {
                print("콤마가 없음")
            } catch CoordinateError.noBracket {
                print("괄호가 없음")
            } catch CoordinateError.theRest {
                print("그 외의 에러")
            }
        }
        return points
    }
    
    func separateCoordinateNumber(inputValue: String) throws -> MyPoint {
        let hasBracket = CharacterSet.init(charactersIn: "()")
        let hasComma = CharacterSet.init(charactersIn: ",")
        if inputValue.rangeOfCharacter(from: hasBracket) != nil {
            let rangeOfNumber = inputValue.index(after: inputValue.startIndex)..<inputValue.index(before: inputValue.endIndex)
            if inputValue.rangeOfCharacter(from: hasComma) != nil {
                do {
                    return try separateByComma(rangeOfNumber: String(inputValue[rangeOfNumber]))
                } catch CoordinateError.inputValue {
                    print("입력값 형식 에러")
                } catch CoordinateError.outOfAvailableInputValue {
                    print("입력값 범위 에러")
                }
            }else {
                throw CoordinateError.noComma
            }
        }else {
            throw CoordinateError.noBracket
        }
        throw CoordinateError.theRest
    }
    
    func separateByComma(rangeOfNumber: String) throws -> MyPoint {
        let values = rangeOfNumber.split(separator: ",").flatMap({Int($0)})
        if values.count != 2 {
            throw CoordinateError.inputValue
        }else {
            if values[0] > 24 || values[1] > 24 {
                throw CoordinateError.outOfAvailableInputValue
            }
        }
        return MyPoint(x: values[0], y: values[1])
    }
    
}
