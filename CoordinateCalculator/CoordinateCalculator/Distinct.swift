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
    func splitLocation(inputTexts : String) -> (locationCount : Int, dividedLocations : [String]) {
        let beforeRefineLocations = inputTexts
        var dividedLocations : [String] = []
        let substringDividedLocations = beforeRefineLocations.split(separator: "-")
        for substringValue in substringDividedLocations {
            dividedLocations.append(String(substringValue))
        }
        return (dividedLocations.count, dividedLocations)
    }
    /// 입력받은 좌표의 갯수를 판단하여 그에 맞는 함수를 출력하는 함수
    func callDependingCoordinates(locationCount : Int, dividedLocations : [String]) throws -> Figure{
        var figure : Figure
        switch locationCount{
        case 4 : // 입력된 Location의 갯수가 4개인 경우
            if Set(dividedLocations).count != 4 { throw ErrorMessage.noRectangle} // 4개의 좌표중 중복되는것이 있으면 에러 발생
            figure = try initMyRectangle(dividedLocations: dividedLocations)
        case 3 : // 입력된 Location의 갯수가 3개인 경우
            figure = try initMyTriangle(dividedLocations: dividedLocations)
        case 2 : // 입력된 Location의 갯수가 2개인 경우
            figure = try initMyLine(dividedLocations: dividedLocations)
        case 1 : // 입력된 Location의 갯수가 1개인 경우
            figure = try initMyPoint(locationText: dividedLocations[0])// 원소가 1개이지만 배열을 벗기기 위해 [0]을 사용 (해당 함수는 1개일때 뿐만 아니라 2개일때 각 좌표들에 값을 대입하기 위한 함수로도 쓰이기 때문에)
        default :
            throw ErrorMessage.outOfRangeError
        }
        return figure
    }
    
    /// 입력받은 좌표가 4개일때 직사각형이 되는지 여부를 판단하고, MyRectangle 구조체의 변수들에 값을 입력하는 함수
    private func initMyRectangle(dividedLocations : [String]) throws -> MyRect {
        var points : [MyPoint] = []
        var lines : [Double] = []
        points.append(try initMyPoint(locationText: dividedLocations[0]))
        for pointIndex in 1...dividedLocations.count-1 {
            points.append(try initMyPoint(locationText: dividedLocations[pointIndex]))
            lines.append(MyLine.lengthCalculator(MyLine.init(startPoint: points[0], endPoint: points[pointIndex]))())
        }
        let twoDiagonals = VerifyRect().outputTwoDiagonal(points: points, lines: lines)
        let rowLine = twoDiagonals.rowLine
        let colLine = twoDiagonals.colLine
        let locations = twoDiagonals.locations
        // 인접하지 않은 두점씩을 잇는 대각선의 길이가 같고 중점이 같은 위치에 있으면 직사각형이다
        if rowLine.crossPoint.crossX == colLine.crossPoint.crossX, rowLine.crossPoint.crossY == colLine.crossPoint.crossY, rowLine.diagonalLength == colLine.diagonalLength {
            let myRect = MyRect.init(pointA: locations[0], pointB: locations[1], pointC: locations[2])
            return myRect
        } else { throw ErrorMessage.noRectangle}
    }
    
    /// 입력받은 좌표가 3개일때 MyTriangle 구조체의 변수들에 값을 입력하는 함수
    private func initMyTriangle(dividedLocations : [String]) throws -> MyTriangle {
        let pointA = try initMyPoint(locationText: dividedLocations[0])
        let pointB = try initMyPoint(locationText: dividedLocations[1])
        let pointC = try initMyPoint(locationText: dividedLocations[2])
        let myTriangle = MyTriangle.init(pointA: pointA, pointB: pointB, pointC: pointC)
        return myTriangle
    }
    
    /// 입력받은 좌표가 2개일때 MyLine 구조체의 변수들에 값을 입력하는 함수
    private func initMyLine(dividedLocations : [String]) throws -> MyLine {
        let pointA = try initMyPoint(locationText: dividedLocations[0])
        let pointB = try initMyPoint(locationText: dividedLocations[1])
        let myLine = MyLine.init(startPoint: pointA, endPoint: pointB)
        return myLine
    }
    /// 입력받은 좌표가 1개 혹은 MyLine 구조체의 하나의 변수에 값을 입력하는 함수
    private func initMyPoint(locationText : String) throws -> MyPoint {
        if locationText == "" { throw ErrorMessage.noValueError }
        else if locationText.last != ")" || locationText.first != "(" { throw ErrorMessage.nonbracket }
        else {
            var beforeRefineLocation = locationText
            beforeRefineLocation.removeFirst()
            beforeRefineLocation.removeLast()
            let locations = beforeRefineLocation.components(separatedBy: ",")
            let myPoint = try numberOfLocations(locations: locations)
            return myPoint
        }
    }
    /// 입력된 좌표가 x,y 2개가 들어왔는지 판단하고 맞으면 값을 return하는 함수
    private func numberOfLocations(locations : [String]) throws -> MyPoint {
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
    private func numberRange(inputX : Int, inputY : Int) throws -> MyPoint {
        if inputX <= 0 || inputY <= 0 || inputX > 25 || inputY > 25{
            throw ErrorMessage.outOfRangeError
        } else {
            let myPoint = MyPoint.init(x: inputX, y: inputY)
            return myPoint
        }
    }
}
