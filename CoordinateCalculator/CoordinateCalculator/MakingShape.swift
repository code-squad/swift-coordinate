//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// MyShape객체를 생성하는 메소드를 갖는 구조체
struct MakingMyShape {
    func makeShapeInstance (_ input: String) throws -> MyShape {
        let numericValues = try SyntaxChecker().getErrorChekcedValue(input)
        let myPoints = makePointInstance(numericValues)
        if myPoints.count == 1 {
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        } else if myPoints.count == 2 {
            return MyLine(pointA: myPoints[0], pointB: myPoints[1])
        } else {
            throw SyntaxChecker.ErrorMessage.ofUnKnownError
        }
    }
    
    private func makePointInstance (_ numericValues: Array<(Int, Int)> ) ->  Array<MyPoint> {
        var myPoints = Array<MyPoint>()
        for numericValue in numericValues {
            let myPoint = MyPoint(x: numericValue.0, y: numericValue.1)
            myPoints.append(myPoint)
        }
        return myPoints
    }
}
