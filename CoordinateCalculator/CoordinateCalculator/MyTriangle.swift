//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by hw on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle : Trianglable {
    
    
    private (set) var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineCA = MyLine(pointA: MyPoint(), pointB: MyPoint())

    var shapeInformation: Double {
        get {
            return (1/2 * lineBC.shapeInformation * lineCA.shapeInformation * getMySineThetaC()).rounded(.toNearestOrAwayFromZero) 
        }
    }
    var mentionOfShapeInformation: String {
        get {
            return "삼각형의 넓이는 \(shapeInformation)"
        }
    }
    
    private func getMySineThetaC () -> Double{
        let squareCosineThetaC = getMyCosineThetaC()*getMyCosineThetaC()
        let sineThetaC = sqrt(1 - squareCosineThetaC)
        return sineThetaC
    }
    
    private func getMyCosineThetaC() -> Double{
        let distanceA = lineBC.shapeInformation
        let distanceC = lineAB.shapeInformation
        let distanceB = lineCA.shapeInformation
        var cosineThetaC: Double = (distanceA * distanceA)
            + (distanceB * distanceB)
            - (distanceC * distanceC)
        cosineThetaC = cosineThetaC / (2 * distanceA * distanceB)
        return cosineThetaC
    }

    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineCA = MyLine(pointA: pointC, pointB: pointA)
    }
    
    func getDrawablePointList() -> [MyPoint] {
        var pointList: [MyPoint]  = [MyPoint]()
        pointList.append(lineAB.pointA)
        pointList.append(lineBC.pointA)
        pointList.append(lineCA.pointA)
        return pointList
    }
}
