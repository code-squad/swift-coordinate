//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 27/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Over1DFigureProtocol {
    private var lineAB: MyLine
    private var lineBC: MyLine
    private var lineAC: MyLine
    
    var points: [MyPoint] {
        let lines = [lineAB, lineBC, lineAC]
        var points: [MyPoint] = []
        lines.forEach {$0.points.forEach {points.append($0)}}
        return points
    }
    
    var valueOfFigure: Double {
        let c = lineAB.valueOfFigure
        let a = lineBC.valueOfFigure
        let b = lineAC.valueOfFigure
        
        let cosB = ((pow(a, 2) + pow(c, 2) - pow(b, 2)) / (2*a*c))
        let sinB = sqrt(1-pow(cosB, 2))
        
        return 0.5*a*c*sinB
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(startPoint: pointA, endPoint: pointB)
        self.lineBC = MyLine(startPoint: pointB, endPoint: pointC)
        self.lineAC = MyLine(startPoint: pointA, endPoint: pointC)
    }
}
