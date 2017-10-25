//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputError: Error {
    case emptyInput
    case invalidInput
    case outOfNumber
    case outOfCoordinate
    case cannotMakeRect
}

enum NumberOfPoints: Int {
    case point = 1
    case line
    case triangle
    case rect
}

struct InputView {
    
    private(set) var point: MyPoint
    private(set) var line: MyLine
    private(set) var triangle: MyTriangle
    private(set) var rect: MyRect
    
    init() {
        point = MyPoint()
        line = MyLine()
        triangle = MyTriangle()
        rect = MyRect()
    }
}

// Methods
extension InputView {
    
    mutating func readInput() throws -> NumberOfPoints? {
        print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.clear)\(ANSICode.text.white) 좌표를 입력하세요. (종료하려면 엔터 입력)")
        guard let input = readLine() else { throw InputError.emptyInput }
        if input == "" { return nil }
        
        if checkInvalidCharacters(input) { throw InputError.invalidInput }

        let points = splitInputToPoint(input)
        
        var pointArray = [MyPoint]()
        for point in points {
            guard let xy = splitXY(point) else { throw InputError.invalidInput }
            let xNum: Float = Float(xy.0) ?? 0
            let yNum: Float = Float(xy.1) ?? 0
            if xNum > 24 || yNum > 24 { throw InputError.outOfNumber }
            pointArray.append(MyPoint(x: xNum, y: yNum))
        }
        let sortedPoints = pointArray.sorted()
        
        if sortedPoints.count == 4 && !isRect(sortedPoints) { throw InputError.cannotMakeRect }
        
        guard let resultFigure = assigneFigueObject(sortedPoints) else { throw InputError.outOfCoordinate }
        return resultFigure
    }

    // "-" 기준으로 나누기
    private func splitInputToPoint(_ input: String) -> [String] {
        return input.split(separator: "-").map(String.init)
    }
    
    // x, y 로 나누기
    private func splitXY(_ point: String) -> (Substring, Substring)? {
        if point[point.startIndex] == "(" && point[point.index(before: point.endIndex)] == ")" {
            guard let split = point.index(of: ",") else { return nil }
            let x = point[point.index(point.startIndex, offsetBy: 1)..<split]
            let y = point[point.index(split, offsetBy: 1)..<point.index(before: point.endIndex)]
            return (x, y)
        }
        return nil
    }
    
    // 입력 스트링이 유효한지 검사
    private func checkInvalidCharacters(_ input: String) -> Bool {
        let validInput = CharacterSet.init(charactersIn: "()-,0123456789")
        let filter = input.trimmingCharacters(in: validInput)
        if !filter.isEmpty { return true } else { return false }
    }
    
    // 직 사각형 좌표인지 검사
    private func isRect(_ pointArray: [MyPoint]) -> Bool {
        var setX = Set<Float>()
        var setY = Set<Float>()
        for point in pointArray {
            setX.insert(point.x)
            setY.insert(point.y)
        }
        if setX.count==2 && setY.count==2 { return true }
        else { return false }
    }
    
    // 입력에 따라 point, line, triangle 프로퍼티에 할당.
    private mutating func assigneFigueObject(_ pointArray: [MyPoint]) -> NumberOfPoints? {
        switch pointArray.count {
        case 1:
            self.point = MyPoint(
                x: pointArray[0].x,
                y: pointArray[0].y)
            return .point
        case 2:
            self.line = MyLine(
                pointA: pointArray[0],
                pointB: pointArray[1])
            return .line
        case 3:
            self.triangle = MyTriangle(
                pointA: pointArray[0],
                pointB: pointArray[1],
                pointC: pointArray[2])
            return .triangle
        case 4:
            let width = pointArray[2].x-pointArray[0].x
            let height = pointArray[1].y-pointArray[0].y
            self.rect = MyRect(
                origin: MyPoint(x: pointArray[0].x + width/2.0,
                                y: pointArray[0].y + height/2.0),
                size: CGSize(width: CGFloat(width),
                             height: CGFloat(height)))
            return .rect
        default: break
        }
        return nil
    }
}

