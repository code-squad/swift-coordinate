//
//  MyLine.swift
//  coordinateCalculator
//
//  Created by JINA on 04/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

struct MyLine: Figure, calculation {
    private(set) var pointA: MyPoint
    private(set) var pointB: MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    var point: [MyPoint] {
        return [pointA, pointB]
    }
    
    func calculate() -> Double {
        let pointX = Double(pointA.x - pointB.x)
        let pointY = Double(pointA.y - pointB.y)
        let calLine = sqrt((pointX * pointX) + (pointY * pointY))
        return calLine
    }
    
    func calculateMent() -> String {
        return "두 점 사이의 거리 : "
    }
}
