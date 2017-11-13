//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 13..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: MyShape {
    var type: OutputView.Figure
    private var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    private var pointC = MyPoint(x: 0, y: 0)
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.type = OutputView.Figure.triangle
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
    }
    
    func calculateOfPosition() -> String {
        return "\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointA.y, col: (pointA.x * 2) + 3))\(ANSICode.text.dot)\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointB.y, col: (pointB.x * 2) + 3))\(ANSICode.text.dot)\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointC.y, col: (pointC.x * 2) + 3))\(ANSICode.text.dot)"
    }

    func calculateOfArea() -> Double {
        let cosX = (pow(lineBC.calculateOfLength(), 2)+pow(lineAB.calculateOfLength(), 2)-pow(lineAC.calculateOfLength(), 2))/(2 * lineBC.calculateOfLength() * lineAB.calculateOfLength())
        let sinX = sqrt(1-pow(cosX, 2))
        let S = 1/2 * (lineBC.calculateOfLength() * lineAB.calculateOfLength() * sinX)
        return S
    }
    
}
