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
    
    func makeShapeInstance (_ input: [MyPoint]) throws -> MyShape {
        switch input.count {
        case 1 :
            return MyPoint(points: input)
        case 2 :
            if MyLine.isPerpectLine(input) == false { throw ErrorMessage.ofImperfectLine}
            return MyPoint(points: input)
        case 3 :
            if MyTriangle.isPerpectTriangle(input) == false { throw ErrorMessage.ofImperfectTriangle}
            return MyTriangle(points: input)
        default: throw SyntaxChecker.ErrorMessage.ofUnKnownError
        }
    }
}
