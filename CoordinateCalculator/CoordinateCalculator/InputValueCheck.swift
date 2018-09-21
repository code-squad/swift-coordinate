//
//  InputValueCheck.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 25..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputValueCheck {
    func makeCheckedValues (_ inputCoordinates: String) throws -> [MyPoint] {
        let validCoordinates = checkValidCharacters(inputCoordinates)
        if validCoordinates == true {
            var points : [(Int, Int)] = []
            var coordinatePoints = [MyPoint]()
            let coordinates = splitHyphen(inputCoordinates)
            for coordinate in coordinates {
                guard let removeParenthesisElements = parenthesisRemoval(coordinate) else { throw ErrorMessage.Message.notBracketValue}
                
                guard let splitCommaElements = splitCommaElemetns(removeParenthesisElements) else { throw ErrorMessage.Message.notSeparatedCommaValue}
                
                guard let convertElements = makeNumericValues(splitCommaElements) else { throw ErrorMessage.Message.notIntValue}
                
                guard let checkPointNumber = checkPointNumber(convertElements) else
                    { throw ErrorMessage.Message.excessInputValue }
                        
                guard let validCoordinatesValue = createCoordinates(checkPointNumber) else { throw ErrorMessage.Message.overCoordinateValue}
                
                points.append(validCoordinatesValue)
                coordinatePoints = createMyPoint(points)
            }
            return coordinatePoints
        }
        else { throw ErrorMessage.Message.invalidInputValue }
    }
    
    private func checkValidCharacters(_ inputCoordinates: String) -> Bool {
        let validInput = CharacterSet.init(charactersIn: "()-,0123456789")
        let filter = inputCoordinates.trimmingCharacters(in: validInput)
        guard filter.isEmpty else { return false}
        return true
    }
    
    private func splitHyphen (_ inputCoordinates: String) -> Array<String> {
        var splitHyphenCoordinates = Array<String>()
        if inputCoordinates.contains("-") {
            splitHyphenCoordinates = inputCoordinates.split(separator: "-").map(String.init)
        } else {
            return [inputCoordinates]
        }
        return splitHyphenCoordinates
    }
    
    private func parenthesisRemoval(_ inputCoordinates: String) -> String? {
        let removeParenthesisElements = inputCoordinates
        if removeParenthesisElements.contains("(") && removeParenthesisElements.contains(")") {
            let resultRemoveParenthesisElements = removeParenthesisElements.trimmingCharacters(in: ["(", ")"])
            return resultRemoveParenthesisElements
        }
        else {
            return nil
        }
    }
    
    private func splitCommaElemetns(_ removeParenthesisCoordinates: String) -> Array<String>? {
        var separateElements: Array<String> = []
        guard removeParenthesisCoordinates.contains(",") else { return nil }
        separateElements = removeParenthesisCoordinates.split(separator: ",").map(String.init)
        return separateElements
    }
    

    private func makeNumericValues(_ separatedCoordinates: Array<String>) -> Array<Int>? {
        let numericValues = separatedCoordinates.compactMap{ tempValue in Int(tempValue) }
        if numericValues.count != separatedCoordinates.count {
            return nil
        }
        return numericValues
    }
    
    private func checkPointNumber(_ convertElements:Array<Int>) -> Array<Int>? {
        let pointNumber = convertElements.count
        if pointNumber > 4  {
            return nil
        }
        return convertElements
    }
    

    func createCoordinates(_ coordinates: Array<Int>) -> (Int, Int)? {
        for index in 0 ..< coordinates.count {
            guard coordinates[index] <= 24 else { return nil }
        }
        return (coordinates[0], coordinates[1])
    }
    
    private func createMyPoint (_ points: Array<(Int, Int)> ) ->  Array<MyPoint> {
        var myPoints = Array<MyPoint>()
        for point in points {
            let myPoint = MyPoint(x: point.0, y: point.1)
            myPoints.append(myPoint)
        }
        return myPoints
    }
}
