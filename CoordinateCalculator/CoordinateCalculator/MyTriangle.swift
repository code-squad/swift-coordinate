//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Drawable {
    
    private let lineAB: MyLine
    private let lineBC: MyLine
    private let lineAC: MyLine
    
    var points: [MyPoint] {
        return lineAB.points + lineBC.points + lineAC.points
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
}
