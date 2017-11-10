//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    var lineAB = MyLine()
    var lineBC = MyLine()
    var lineAC = MyLine()
    init(_ coordinateModel: CoordinateModel) {
        self.init(pointA: coordinateModel[0], pointB: coordinateModel[1], pointC: coordinateModel[2])
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB.pointA = pointA
        self.lineAB.pointB = pointB
        self.lineBC.pointA = pointB
        self.lineBC.pointB = pointC
        self.lineAC.pointA = pointA
        self.lineAC.pointB = pointC
    }
    
    func calculateTriangleArea() -> Double {
        let triangle = calculateCosBAndLineA()
        let sinB = sqrt(1 - pow(triangle.cosineB, 2))
        let triangleArea = 0.5 * triangle.lineA * triangle.lineC * sinB
        return triangleArea
    }
    
    private func calculateCosBAndLineA() -> (cosineB: Double, lineA: Double, lineC: Double) {
        let lineDistanceA = lineBC.calcurateDistanceTwoPoints()
        let lineDistanceB = lineAC.calcurateDistanceTwoPoints()
        let lineDistanceC = lineAB.calcurateDistanceTwoPoints()
        let cosB = (pow(lineDistanceA, 2) + pow(lineDistanceC, 2) - pow(lineDistanceB, 2)) / (2 * lineDistanceA * lineDistanceC)
        return (cosB, lineDistanceA, lineDistanceC)
    }
    
}
