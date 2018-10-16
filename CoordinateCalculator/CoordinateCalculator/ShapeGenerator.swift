//
//  ShapeGenerator.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 16/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

public enum ShapeValidation: String {
    case notSatisfyTriangleInequality = "삼각형이 성립되지않는 좌표입니다."
    case notSatisfyRectangle = "직사각형이 성립되지않는 좌표입니다."
    case notSatisfyRectangleSupported = "지원하지 않는 직사각형입니다. x축과 y축에 모두 평행한 직사각형만 지원합니다."
    case outOfRangeMyPoint = "최대 3개의 좌표까지 입력 가능합니다."
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
    
    private static func calculateDistance(between pointA: MyPoint, and pointB: MyPoint) -> Double {
        return sqrt(pow(Double(pointA.x-pointB.x), 2) + pow(Double(pointA.y-pointB.y), 2))
    }
    
    private static func satisfyTriangleInequality(of points: [MyPoint]) -> Bool {
        var sideLengths = [Double]()
        sideLengths.append(calculateDistance(between: points[0], and: points[1]))
        sideLengths.append(calculateDistance(between: points[1], and: points[2]))
        sideLengths.append(calculateDistance(between: points[0], and: points[2]))
        sideLengths.sort()
        return sideLengths[0] + sideLengths[1] > sideLengths[2]
    }
    
    private static func makeRectangleLengthSet(by points: [MyPoint]) -> Set<Double> {
        var lengthSet = Set<Double>()
        lengthSet.insert(calculateDistance(between: points[0], and: points[1]))
        lengthSet.insert(calculateDistance(between: points[0], and: points[2]))
        lengthSet.insert(calculateDistance(between: points[0], and: points[3]))
        lengthSet.insert(calculateDistance(between: points[1], and: points[2]))
        lengthSet.insert(calculateDistance(between: points[1], and: points[3]))
        lengthSet.insert(calculateDistance(between: points[2], and: points[3]))
        return lengthSet
    }
    
    private static func satisfyRegtangle(of points: [MyPoint]) -> Bool {
        let lengthSet = makeRectangleLengthSet(by: points)
        return (lengthSet.count == 2 || lengthSet.count == 3)
    }
    
    private static func satisfyRegtangleSupported(of points: [MyPoint]) -> Bool {
        var xSet = Set<Int>(), ySet = Set<Int>()
        for point in points {
            xSet.insert(point.x)
            ySet.insert(point.y)
        }
        return ((xSet.count == 1 || xSet.count == 2 ) && (ySet.count == 1 || ySet.count == 2))
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
            guard satisfyTriangleInequality(of: points) else {
                OutputView.printMessage(of: .notSatisfyTriangleInequality)
                return nil
            }
            return MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
        case 4:
            guard satisfyRegtangle(of: points) else {
                OutputView.printMessage(of: .notSatisfyRectangle)
                return nil
            }
            guard satisfyRegtangleSupported(of: points) else {
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
