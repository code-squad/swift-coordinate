//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Elena on 02/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//


import Foundation

struct MyLine: DistanceProtocol,FigureProtocol {
    var descriptionTwoPoint: String { return "두 점 사이의 거리는" }
    
    var valueOfPoint: Double { return sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2)) }
    
    
    private (set) var pointA = MyPoint(x: 0, y: 0)
    private (set) var pointB = MyPoint(x: 0, y: 0)
    
    var points: [MyPoint] {
        return [pointA, pointB]
    }
    
    init(_ pointA: MyPoint,_ pointB: MyPoint ) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
}

