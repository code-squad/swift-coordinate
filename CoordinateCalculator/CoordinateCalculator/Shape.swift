//
//  Shape.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 13/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape {
    var points: [MyPoint] { get }
}

protocol CalculableShape: Shape {
    var calculationMessage: String { get }
    func calculate() -> Double
}

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
        case 1:
            return points[0]
        case 2:
            return MyLine(pointA: points[0], pointB: points[1])
        default:
            return nil
        }
    }
}
