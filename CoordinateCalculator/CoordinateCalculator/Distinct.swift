//
//  Distinct.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Distinct {
    /// 입력받은 Text를 나누어 좌표의 갯수와 나뉜 좌표들을 return하는 함수
    func splitLocation(inputTexts : String) throws -> (loctionCount : Int, dividedLocations : [String.SubSequence]) {
        if inputTexts == "" { throw ErrorMessage.noValueError }
        let beforeRefineLocations = inputTexts
        let dividedLocations = beforeRefineLocations.split(separator: "-")
        return (dividedLocations.count, dividedLocations)
    }
    /// 입력받은 좌표가 2개일때 MyLine 구조체의 변수들에 값을 입력하는 함수
    func initMyLine(dividedLocations : [String.SubSequence]) throws -> MyLine {
        let pointA = try initMyPoint(locationText: dividedLocations[0])
        let pointB = try initMyPoint(locationText: dividedLocations[1])
        let myLine = MyLine.init(pointA: pointA, pointB: pointB)
        return myLine
    }
    /// 입력받은 좌표가 1개 혹은 MyLine 구조체의 하나의 변수에 값을 입력하는 함수
    func initMyPoint(locationText : String.SubSequence) throws -> MyPoint {
        if locationText == "" { throw ErrorMessage.noValueError }
        else if locationText[locationText.index(before: locationText.endIndex)] != ")" || locationText[locationText.startIndex] != "(" { throw ErrorMessage.nonbracket }
        else {
            var beforeRefineLocation = locationText
            beforeRefineLocation.removeFirst()
            beforeRefineLocation.removeLast()
            let locations = beforeRefineLocation.split(separator: ",")
            let myPoint = try numberOfLocations(locations: locations)
            return myPoint
        }
    }
    /// 입력된 좌표가 x,y 2개가 들어왔는지 판단하고 맞으면 값을 return하는 함수
    func numberOfLocations(locations : [String.SubSequence]) throws -> MyPoint {
        if locations.count != 2 { throw ErrorMessage.outOfRangeError}
        else {
            guard let inputX = Int(locations[0]) else {
                throw ErrorMessage.typeMissError
            }
            guard let inputY = Int(locations[1]) else {
                throw ErrorMessage.typeMissError
            }
            let myPoint = try numberRange(inputX: inputX, inputY: inputY)
            return myPoint
        }
    }
    /// x와 y의 범위를 판단하는 함수
    func numberRange(inputX : Int, inputY : Int) throws -> MyPoint {
        if inputX <= 0 || inputY <= 0 || inputX > 25 || inputY > 25{
            throw ErrorMessage.outOfRangeError
        } else {
            let myPoint = MyPoint.init(x: inputX, y: inputY)
            return myPoint
        }
    }
}
