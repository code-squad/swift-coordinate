//
//  ErrorShape.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 30..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeChecker {

    func validShape(_ shape: MyShape) throws -> MyShape {
        if shape.inValidShape() {
            switch shape {
            case is MyLine : throw ErrorType.ShapeCase.wrongLine
            case is MyTriangle : throw ErrorType.ShapeCase.wrongTriangle
            default: throw ErrorType.ShapeCase.unexpected
            }
        } else { return shape }
    }
    
}
