//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

public enum InputError: Error {
    case emptyInput
    case invalidInput
    case outOfNumber
}

struct InputView {
    
    func readInput() throws -> [MyPoint]? {
        print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.clear)\(ANSICode.text.white) 좌표를 입력하세요. (종료하려면 엔터 입력)")
        guard let input = readLine() else { throw InputError.emptyInput }
        if input == "" { return nil }

        let points = splitInputToPoint(input: input)
        
        var pointArray = [MyPoint]()
        
        for point in points {
            guard let xy = splitXY(point: point) else { throw InputError.invalidInput }
            guard let xNum: Int = Int(xy.0) else { throw InputError.invalidInput }
            guard let yNum: Int = Int(xy.1) else { throw InputError.invalidInput }
            if xNum > 24 || yNum > 24 { throw InputError.outOfNumber }
            pointArray.append(MyPoint(x: xNum, y: yNum))
        }
        return pointArray
    }
    
    // "-" 기준으로 나누기
    private func splitInputToPoint(input: String) -> [String] {
        return input.split(separator: "-").map(String.init)
    }
    
    // x, y 로 나누기
    private func splitXY(point: String) -> (Substring, Substring)? {
        guard let split = point.index(of: ",") else { return nil }
        let x = point[point.index(point.startIndex, offsetBy: 1)..<split]
        let y = point[point.index(split, offsetBy: 1)..<point.index(before: point.endIndex)]
        return (x, y)
    }
}

