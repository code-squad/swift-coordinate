//
//  Shape.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 13/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Point = (x: Int, y: Int)

protocol Shape {
    var points: [MyPoint] { get }
}

protocol CalculableShape: Shape {
    var calculationMessage: String { get }
    func calculate() -> Double
}

struct ShapeGenerator {
    static func generatePoint(from coordinate: String) -> Point? {
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
        return point
    }
    
    static func generateShape(by points: [Point]) -> Shape? {
        switch points.count {
        case 1:
            return MyPoint(x: points[0].x, y: points[0].y)
        case 2:
            return MyLine(pointA: MyPoint(x: points[0].x, y: points[0].y), pointB: MyPoint(x: points[1].x, y: points[1].y))
        default:
            return nil
        }
    }
}
