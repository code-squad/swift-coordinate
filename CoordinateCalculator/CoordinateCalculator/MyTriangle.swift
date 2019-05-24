//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Drawable, Explanation {
    
  
    internal var points: [MyPoint]

    init(_ pointA: MyPoint, _ pointB: MyPoint, _ pointC: MyPoint) {
        self.lineAB = MyLine(pointA, pointB)
        self.lineBC = MyLine(pointB, pointC)
        self.lineAC = MyLine(pointC, pointA)
        self.points = [pointA,pointB,pointC]
    }
    
    private (set) var lineAB = MyLine(MyPoint(), MyPoint())
    private (set) var lineBC = MyLine(MyPoint(), MyPoint())
    private (set) var lineAC = MyLine(MyPoint(), MyPoint())
    
  
    private var size: Double {
        let s = (lineAB.value + lineAC.value + lineBC.value) / 2
        return sqrt(s * (s - lineAB.value) * (s - lineAC.value) * (s - lineBC.value))
    }
    
    var explanation: String {
        return ExplanationType.triangle.rawValue + ": \(size)"
    }
    
}

