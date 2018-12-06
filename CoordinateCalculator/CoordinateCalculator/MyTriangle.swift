//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Elena on 06/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: DistanceProtocol {
    var points: [MyPoint] {
        return [lineAB.pointA, lineAB.pointB, lineAC.pointB]
    }
    
    private var lineAB = MyLine(MyPoint(x: 0, y: 0), MyPoint(x: 0, y: 0))
    private var lineBC = MyLine(MyPoint(x: 0, y: 0), MyPoint(x: 0, y: 0))
    private var lineAC = MyLine(MyPoint(x: 0, y: 0), MyPoint(x: 0, y: 0))
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA, pointB)
        self.lineBC = MyLine(pointB, pointC)
        self.lineAC = MyLine(pointA, pointC)
    }
    
    
    
    var descriptionTwoPoint: String {
        return "삼각형의 넓이는"
    }
    
    var valueOfPoint: Double {
        let a = lineAB.valueOfPoint
        let b = lineAC.valueOfPoint
        let c = lineBC.valueOfPoint
        let cos = (pow(a, 2) + pow(c, 2) - pow(b, 2)) / (2 * a * c)
        let sin = sqrt(1 - pow(cos, 2))
        return 0.5 * a * c * sin
    }
    
}
