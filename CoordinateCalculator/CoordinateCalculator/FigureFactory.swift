//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory {
    static public func makeFigure(pairs: [Pair]) throws -> AxisDrawable {
        switch pairs.count {
        case 1:
            return makePoint(using: pairs[0])
        case 2:
            return makeLine(using: pairs)
        case 3:
            return makeTriangle(using: pairs)
        case 4:
            return try makeRect(using: pairs)
        default:
            throw FactoryError.impossibleToCreateInstance
        }
    }
    
    static private func makePoint(using pair: Pair) -> MyPoint {
        return MyPoint(x: pair.x, y: pair.y)
    }
    
    static private func makeLine(using pairs:[Pair]) -> MyLine {
        let startPoint = makePoint(using: pairs[0])
        let endPoint = makePoint(using: pairs[1])
        return MyLine(pointA: startPoint, pointB: endPoint)
    }
    
    static private func makeTriangle(using pairs: [Pair]) -> MyTriangle {
        let pointA = makePoint(using: pairs[0])
        let pointB = makePoint(using: pairs[1])
        let pointC = makePoint(using: pairs[2])
        return MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
    }

    static private func makeRect(using pairs: [Pair]) throws -> MyRect {
        let setX = Set<Int>(pairs.map { (x, _) in x })
        let setY = Set<Int>(pairs.map { (_, y) in y })

        if CoordinateValidator.isNotRectangle(setX: setX, setY: setY) {
            throw FactoryError.isNotRectangle
        }
        let (minX, maxX) = try getMinMax(of: setX)
        let (minY, maxY) = try getMinMax(of: setY)
        let leftTop = MyPoint(x: minX, y: maxY)
        let rightBottom = MyPoint(x: maxX, y: minY)
        return MyRect(leftTop: leftTop, rightBottom: rightBottom)
    }
    
    static private func getMinMax(of set: Set<Int>) throws -> (Int, Int) {
        guard let min = set.min(), let max = set.max() else {
            throw FactoryError.invalidRectXY
        }
        return (min, max)
    }
}
