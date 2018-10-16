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
    
    private static func sortXbyASC(first: MyPoint, second: MyPoint) -> Bool {
        return first.x < second.x
    }
    
    private static func searchRectProperty(of points: [MyPoint]) -> (myPoint: MyPoint, cgSize: CGSize) {
        var points = points
        points.sort(by: sortXbyASC)
        let origin = points[0].y < points[1].y ? points[1] : points[0]
        let rightBottom = points[2].y < points[3].y ? points[2] : points[3]
        return (origin, CGSize(width: rightBottom.x-origin.x, height: origin.y-rightBottom.y))
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
            guard ShapeValidator.satisfyRegtangle(of: points) else {
                OutputView.printMessage(of: .notSatisfyRectangle)
                return nil
            }
            guard ShapeValidator.satisfyRegtangleSupported(of: points) else {
                OutputView.printMessage(of: .notSatisfyRectangleSupported)
                return nil
            }
            let rectProperty = searchRectProperty(of: points)
            return MyRect(origin: rectProperty.myPoint, size: rectProperty.cgSize)
        default:
            OutputView.printMessage(of: .outOfRangeMyPoint)
            return nil
        }
    }
}
