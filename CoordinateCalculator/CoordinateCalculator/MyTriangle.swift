//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 28/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle:Drawable,hasArea {
    
    var lineA = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    
    var points:[MyPoint] {
        return [lineA.pointA,lineB.pointA,lineC.pointA]
    }
    
    var calculateArea:Double {
        let a = (lineA.pointA.x * lineB.pointA.y)+(lineB.pointA.x * lineC.pointA.y)+(lineC.pointA.x * lineA.pointA.y)
        let b = (lineA.pointA.x * lineC.pointA.y)+(lineC.pointA.x * lineB.pointA.y)+(lineB.pointA.x * lineA.pointA.y)
        return Double(abs(a-b)) / 2.0
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineA = MyLine(pointA: pointA, pointB: pointB)
        self.lineB = MyLine(pointA: pointB, pointB: pointC)
        self.lineC = MyLine(pointA: pointC, pointB: pointA)
    }
    
}
