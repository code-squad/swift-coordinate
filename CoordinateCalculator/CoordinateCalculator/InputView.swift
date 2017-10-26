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
    case cannotMakeTriangle
    case cannotMakeRect
}

struct InputView {}

// Methods
extension InputView {
    
    mutating func readInput() throws -> [MyPoint]? {
        print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.clear)\(ANSICode.text.white) 좌표를 입력하세요. (종료하려면 엔터 입력)")
        let input = readLine() ?? ""
        
        if input == "" { return nil }
        
        if checkInvalidCharacters(input) { throw InputError.invalidInput }
        
        let points = splitInputToPoint(input)
        
        let coordinates = try? splitXY(points)
        
        return coordinates
        
    }

    // "-" 기준으로 나누기
    private func splitInputToPoint(_ input: String) -> [String] {
        return input.split(separator: "-").map(String.init)
    }
    
    // x, y 로 나누기
    private func splitXY(_ points: [String]) throws -> [MyPoint] {
        var coordinates = [MyPoint]()
        for point in points {
            guard let split = point.index(of: ",") else { throw InputError.invalidInput }
            let x = point[point.index(point.startIndex, offsetBy: 1)..<split]
            let y = point[point.index(split, offsetBy: 1)..<point.index(before: point.endIndex)]
            let xNum = Int(x) ?? 0
            let yNum = Int(y) ?? 0
            if xNum>24 || yNum>24 { throw InputError.outOfNumber }
            coordinates.append(MyPoint(x: xNum, y: yNum))
        }
        return coordinates
    }
    
    // 입력 스트링이 유효한지 검사
    private func checkInvalidCharacters(_ input: String) -> Bool {
        let validInput = CharacterSet.init(charactersIn: "()-,0123456789")
        let filter = input.trimmingCharacters(in: validInput)
        if !filter.isEmpty { return true } else { return false }
    }
}

