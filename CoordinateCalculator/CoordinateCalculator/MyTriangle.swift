//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 15..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle : MyShape {
    var lineAB = MyLine(pointA: MyPoint(x : 0, y : 0), pointB: MyPoint(x : 0, y : 0))
    var lineBC = MyLine(pointA: MyPoint(x : 0, y : 0), pointB: MyPoint(x : 0, y : 0))
    var lineAC = MyLine(pointA: MyPoint(x : 0, y : 0), pointB: MyPoint(x : 0, y : 0))
    var currentShape: String = "triangle"
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    init(points : [MyPoint]) {
        let temp : [MyPoint] = points.sorted(by: {$0.x < $1.x}) //[b,a,c]
        self.lineAB = MyLine(pointA: temp[0], pointB: temp[1])
        self.lineBC = MyLine(pointA: temp[0], pointB: temp[2])
        self.lineAC = MyLine(pointA: temp[1], pointB: temp[2])
    }
    
    func generateCoordinate() -> [MyPoint] {
        let threePoints = [MyPoint.init(x: self.lineAB.pointA.x, y: self.lineAB.pointA.x),
                           MyPoint.init(x: self.lineAB.pointB.x, y: self.lineAB.pointB.y),
                           MyPoint.init(x: self.lineAC.pointB.x, y: self.lineAC.pointB.y)]
        return threePoints
    }
    
    func calculateShape() -> Double {
        let a = self.lineBC.calculateShape()
        let b = self.lineAC.calculateShape()
        let c = self.lineAB.calculateShape()
        let cosB = (pow(a, 2) + pow(c, 2) - pow(b, 2)) / (2 * a * c)
        let sinB = sqrt(1 - pow(cosB, 2))
        let areaOfTriangle = 0.5 * a * c * sinB
        return areaOfTriangle
    }
}
