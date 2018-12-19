//
//  MyTriangle.swift
//  coordinateCalculator
//
//  Created by JINA on 19/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

struct MyTriangle: Figure, calculation {
    var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    var point: [MyPoint] {
        return [lineAB.pointA,lineBC.pointA,lineAC.pointB]
    }
    
    func calculate() -> Double {
        let x1 = lineAB.pointA.x
        let y1 = lineAB.pointA.y
        let x2 = lineBC.pointA.x
        let y2 = lineBC.pointA.y
        let x3 = lineAC.pointB.x
        let y3 = lineAC.pointB.y
        
        return 0.5 * Double((x1 * y2) + (x2 * y3) + (x3 * y1) - (x1 * y3) - (x3 * y2) - (x2 * y1)) * -1
    }
    
    func calculateMent() -> String {
        return "삼각형의 넓이 : "
    }
    
}
