//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// MyShape객체를 생성하는 메소드를 갖는 구조체 (생성시 도형 불완전성 체크)
struct MakingMyShape {
    enum ErrorMessage: String, Error {
        case ofImperfectLine = "같은좌표는 직선을 생성할 수 없습니다."
        case ofImperfectTriangle = "같은좌표는 삼각형을 생성할 수 없습니다."
    }
    
    func makeShapeInstance (_ input: String) throws -> MyShape {
        let numericValues = try SyntaxChecker().getErrorChekcedValue(input)
        let myPoints = makePointInstance(numericValues)
        switch myPoints.count {
        case 1 :
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        case 2 :
            if MyLine.isPerpectLine(myPoints) == false { throw ErrorMessage.ofImperfectLine}
            return MyLine(pointA: myPoints[0], pointB: myPoints[1])
        case 3 :
            if MyTriangle.isPerpectTriangle(myPoints) == false { throw ErrorMessage.ofImperfectTriangle}
            return MyTriangle(pointA: myPoints[0], pointB: myPoints[1], pointC: myPoints[2])
        default: throw SyntaxChecker.ErrorMessage.ofUnKnownError
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
