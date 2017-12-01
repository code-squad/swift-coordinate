//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// line과 point를 타입으로 갖는 프로토콜 선언
protocol MyShape {
    var type: SyntaxChecker.Shape { get set }
    func drawShape () -> Double
    func showCalculationresult () -> Double
    func message () -> String
}


struct makingMyShape {
    func makeShapeInstance (_ input: String) throws -> MyShape {
        let validValue = try SyntaxChecker().getErrorChekcedValue(input)
        let temp = makePointInstance(validValue)
        if validValue.count == 1 {
            return temp[0]
        } else if validValue.count == 2 {
            return MyLine(pointA: temp[0], pointB: temp[1])
        } else {
            throw SyntaxChecker.ErrorMessage.ofUnKnownError
        }
    }
    
    private func makePointInstance (_ input: Array<(Int, Int)> ) ->  Array<MyPoint> {
        var temp = Array<MyPoint>()
        for index in input {
            let tempPoint = MyPoint(x: index.0, y: index.1)
            temp.append(tempPoint)
        }
        return temp
    }
}
