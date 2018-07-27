//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 27/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private var lineAB: MyLine
    private var lineBC: MyLine
    private var lineAC: MyLine
    
    var pointsForDisplay: [MyPoint] {
        let lines = [lineAB, lineBC, lineAC]
        var points: [MyPoint] = []
        lines.forEach {$0.pointsForDisplay.forEach {points.append($0)}}
        return points
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(startPoint: pointA, endPoint: pointB)
        self.lineBC = MyLine(startPoint: pointB, endPoint: pointC)
        self.lineAC = MyLine(startPoint: pointA, endPoint: pointC)
    }
}
