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
}

enum NumberOfPoints: Int {
    case point = 1
    case line
}

struct InputView {
    
    private(set) var point: MyPoint
    private(set) var line: MyLine
    
    init() {
        point = MyPoint()
        line = MyLine()
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
        let count = points.count
        
        var pointArray = [MyPoint]()
        
        for point in points {
            guard let xy = splitXY(point) else { throw InputError.invalidInput }
            let xNum: Int = Int(xy.0) ?? 0
            let yNum: Int = Int(xy.1) ?? 0
            if xNum > 24 || yNum > 24 { throw InputError.outOfNumber }
            pointArray.append(MyPoint(x: xNum, y: yNum))
        }
        switch count {
        case 1:
            self.point = MyPoint(x: pointArray[0].x, y: pointArray[0].y)
            return .point
        case 2:
            self.line = MyLine(pointA: pointArray[0], pointB: pointArray[1])
            return .line
        default: break
        }
        return nil
    }
    
    // "-" 기준으로 나누기
    private func splitInputToPoint(_ input: String) -> [String] {
        return input.split(separator: "-").map(String.init)
    }
    
    // x, y 로 나누기
    private func splitXY(_ point: String) -> (Substring, Substring)? {
        guard let split = point.index(of: ",") else { return nil }
        let x = point[point.index(point.startIndex, offsetBy: 1)..<split]
        let y = point[point.index(split, offsetBy: 1)..<point.index(before: point.endIndex)]
        return (x, y)
    }
    
    // 입력 스트링이 유효한지 검사
    private func checkInvalidCharacters(_ input: String) -> Bool {
        let validInput = CharacterSet.init(charactersIn: "()-,0123456789")
        let filter = input.trimmingCharacters(in: validInput)
        if !filter.isEmpty { return true } else { return false }
    }
}

