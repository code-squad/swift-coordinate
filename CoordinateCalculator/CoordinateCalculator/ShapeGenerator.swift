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
    
    private static func makeRectangleLengthSetArray(by points: [MyPoint]) -> [Double] {
        var lengthSet = Set<Double>()
        lengthSet.insert(calculateDistance(between: points[0], and: points[1]))
        lengthSet.insert(calculateDistance(between: points[0], and: points[2]))
        lengthSet.insert(calculateDistance(between: points[0], and: points[3]))
        lengthSet.insert(calculateDistance(between: points[1], and: points[2]))
        lengthSet.insert(calculateDistance(between: points[1], and: points[3]))
        lengthSet.insert(calculateDistance(between: points[2], and: points[3]))
        return lengthSet.sorted()
    }
    
    private static func satisfyRegtangle(of points: [MyPoint]) -> Bool {
        let lengthSet = makeRectangleLengthSetArray(by: points)
        return (lengthSet.count == 2 || lengthSet.count == 3)
    }
    
    private static func sortXbyASC(first: MyPoint, second: MyPoint) -> Bool {
        return first.x < second.x
    }
    
    private static func sortYbyASC(first: MyPoint, second: MyPoint) -> Bool {
        return first.y < second.y
    }
    
    private static func searchRectProperty(of points: [MyPoint]) -> (myPoint: MyPoint, cgSize: CGSize) {
        var points = points
        points.sort(by: sortXbyASC)
        let origin = sortYbyASC(first: points[0], second: points[1]) ? points[1] : points[0]
        let leftBottom = sortYbyASC(first: points[0], second: points[1]) ? points[0] : points[1]
        let rightTop = sortYbyASC(first: points[2], second: points[3]) ? points[3] : points[2]
        let width = calculateDistance(between: origin, and: rightTop)
        let height = calculateDistance(between: origin, and: leftBottom)
        return (origin, CGSize(width: width, height: height))
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
            let rectProperty = searchRectProperty(of: points)
            return MyRect(origin: rectProperty.myPoint, size: rectProperty.cgSize)
        default:
            OutputView.printMessage(of: .outOfRangeMyPoint)
            return nil
        }
    }
}
