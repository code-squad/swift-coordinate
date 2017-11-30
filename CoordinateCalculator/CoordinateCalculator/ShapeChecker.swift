//
//  ErrorShape.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 30..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeChecker {
    
    enum ShapeCase: String, Error {
        case wrongLine = "직선을 생성할 수 없는 좌표입니다."
        case wrongTriangle = "삼각형을 생성할 수 없는 좌표입니다."
        case unexpected = "Unexpected Error"
    }

    func validShape(_ shape: MyShape) throws -> MyShape {
        if shape.inValidShape() {
            switch shape {
            case is MyLine : throw ShapeCase.wrongLine
            case is MyTriangle : throw ShapeCase.wrongTriangle
            default: throw ShapeCase.unexpected
            }
        } else { return shape }
    }
    
}
