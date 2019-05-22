//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Drawable {
    
    var points: [MyPoint] {
        return [lineAC.pointA,lineAC.pointB,lineBC.pointA]
    }
    
    private (set) var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    
    
    //    private (set) var pointA = MyPoint(x: 0, y: 0)
    //    private (set) var pointB = MyPoint(x: 0, y: 0)
    
    var size: Double {
        let s = (lineAB.getValue() + lineAC.getValue() + lineBC.getValue()) / 2
        return sqrt(s * (s - lineAB.getValue()) * (s - lineAC.getValue()) * (s - lineBC.getValue()))
    }
    
    var description: String {
        return "삼각형의 넓이 : \(size)"
    }
    
}

