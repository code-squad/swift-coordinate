//
//  ShapeFactory.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
// MyShape객체를 생성하는 메소드를 갖는 구조체 (생성시 도형 불완전성 체크)
struct ShapeFactory {
    enum ErrorMessage: String, Error {
        case ofImperfectLine = "같은좌표는 직선을 생성할 수 없습니다."
        case ofImperfectTriangle = "삼각형을 생성할 수 없는 좌표입니다."
        case ofImperfectRectangle = "직사각형을 생성할 수 없는 좌표입니다."
    }
    
    // 타입메서드 사용 : 속성이 업는 경우 인스턴스를 생성하지 않고 해당 타입메서드를 하나의 기능처럼 사용할 수 있다.
    static func makeShapeInstance (_ myPoints: [MyPoint]) throws -> MyShape {
        switch myPoints.count {
        case 1 :
            return MyPoint(points: myPoints)
        case 2 :
            if MyLine.isPerpectLine(myPoints) == false {
                throw ErrorMessage.ofImperfectLine
            }
            return MyLine(points: myPoints)
        case 3 :
            if MyTriangle.isPerpectTriangle(myPoints) == false {
                throw ErrorMessage.ofImperfectTriangle
            }
            return MyTriangle(points: myPoints)
        case 4 :
            if MyRect.isPerpectRectangle(myPoints) == false {
                throw ErrorMessage.ofImperfectRectangle
            }
            return MyRect(points: myPoints)
        default: throw SyntaxChecker.ErrorMessage.ofUnKnownError
        }
    }
}

