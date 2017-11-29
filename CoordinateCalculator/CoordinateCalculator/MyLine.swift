//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: MyShape {
    var type: SyntaxChecker.Shape
    private (set) var pointA = MyPoint(x: 0, y: 0)
    private (set) var pointB = MyPoint(x: 0, y: 0)
    init(pointA: MyPoint, pointB: MyPoint) {
        self.type = SyntaxChecker.Shape.line
        self.pointA = pointA
        self.pointB = pointB
    }
    
    // 좌표간의 거리를 MyLine구조체에 추가
    func calculateOfLength() -> Double {
        let firstPoint = pow(Double(abs(pointA.x - pointB.x)), 2)
        let secondPoint = pow(Double(abs(pointA.y - pointB.y)), 2)
        return sqrt(firstPoint + secondPoint)
    }
}

