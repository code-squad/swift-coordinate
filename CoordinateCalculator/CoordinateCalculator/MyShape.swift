//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 14..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyShape {
    var point : MyPoint = MyPoint.init(x: 0, y: 0)
    var line : MyLine = MyLine.init(pointA: MyPoint(x : 0, y : 0), pointB: MyPoint(x : 0, y : 0))
    var triangle : MyTriangle = MyTriangle.init(pointA: MyPoint(x : 0, y : 0), pointB: MyPoint(x : 0, y : 0), pointC: MyPoint(x : 0, y : 0))
    
    var currentShape : String = ""
    
    init(point : [MyPoint]) {
        self.point = point[0]
    }
    
    init(pointsOfLine : [MyPoint]) {
        self.line = MyLine(points: pointsOfLine)
        self.currentShape = "line"
    }
    
    init(pointsOfTriangle : [MyPoint]) {
        self.triangle = MyTriangle(points: pointsOfTriangle)
        self.currentShape = "triangle"
    }
}
