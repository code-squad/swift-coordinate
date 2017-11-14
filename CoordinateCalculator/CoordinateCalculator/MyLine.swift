//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: MyShape {
    var type: OutputView.Figure
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    init(pointA: MyPoint, pointB: MyPoint) {
        self.type = OutputView.Figure.line
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func calculateOfPosition() -> String {
        return "\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointA.y, col: (pointA.x * 2) + 3))\(ANSICode.text.dot)\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointB.y, col: (pointB.x * 2) + 3))\(ANSICode.text.dot)"
    }
    
    func calculateOfLength() -> Double {
        return sqrt(abs(pow(Double(pointA.x - pointB.x),2) + pow(Double(pointA.y - pointB.y),2)))
    }
    
}
