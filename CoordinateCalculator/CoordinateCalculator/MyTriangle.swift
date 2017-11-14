//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 13..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: MyShape {
    private var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointC, pointB: pointA)
    }
    
    func getPointA(myLine: MyLine) -> MyPoint {
        return MyPoint(x: myLine.pointA.x, y: myLine.pointA.y)
    }
    
    func calculateOfPosition() -> [MyPoint] {
        return [getPointA(myLine: lineAB), getPointA(myLine: lineBC), getPointA(myLine: lineAC)]
    }

    func calculateOfArea() -> Double {
        let cosX = (pow(lineBC.calculateOfLength(), 2)+pow(lineAB.calculateOfLength(), 2)-pow(lineAC.calculateOfLength(), 2))/(2 * lineBC.calculateOfLength() * lineAB.calculateOfLength())
        let sinX = sqrt(1-pow(cosX, 2))
        let S = 1/2 * (lineBC.calculateOfLength() * lineAB.calculateOfLength() * sinX)
        return S
    }
    
    func resultOfMyShape() -> Double {
        return calculateOfArea()
    }
    
    var resultDescription: String = {
        return "넓이"
    }()

}
