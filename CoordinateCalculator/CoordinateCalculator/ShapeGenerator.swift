//
//  ShapeGenerator.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 16/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeGenerator {
    static func generatePoint(from coordinate: String) -> MyPoint? {
        let textValidator = TextValidator(text: coordinate)
        guard textValidator.hasNoInvalidCharacter() else {
            OutputView.printMessageOfTextInvalidation()
            return nil
        }
        let coordinatesValidation = textValidator.checkTextError()
        guard coordinatesValidation == .success else {
            OutputView.printMessage(of: coordinatesValidation)
            return nil
        }
        let point = TextProcessor.extractPoint(from: coordinate)
        return MyPoint(x: point.x, y: point.y)
    }
    
    static func generateShape(by points: [MyPoint]) -> Shape? {
        switch points.count {
        case 0:
            return nil
        case 1:
            return points[0]
        case 2:
            return MyLine(pointA: points[0], pointB: points[1])
        case 3:
            guard ShapeValidator.satisfyTriangleInequality(of: points) else {
                OutputView.printMessage(of: .notSatisfyTriangleInequality)
                return nil
            }
            return MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
        case 4:
            guard ShapeValidator.satisfyRectangle(of: points) else {
                OutputView.printMessage(of: .notSatisfyRectangle)
                return nil
            }
            guard ShapeValidator.satisfyRectangleSupported(of: points) else {
                OutputView.printMessage(of: .notSatisfyRectangleSupported)
                return nil
            }
            return MyRect(points: points)
        default:
            OutputView.printMessage(of: .outOfRangeMyPoint)
            return nil
        }
    }
}
