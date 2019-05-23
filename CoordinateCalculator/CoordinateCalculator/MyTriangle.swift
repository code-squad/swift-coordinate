//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Drawable, Explanation {
    
    var points: [MyPoint] {
        return [lineAC.pointA,lineAC.pointB,lineBC.pointA]
    }
    
    private (set) var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private (set) var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    
    private var size: Double {
        let s = (lineAB.value + lineAC.value + lineBC.value) / 2
        return sqrt(s * (s - lineAB.value) * (s - lineAC.value) * (s - lineBC.value))
    }
    
    var explanation: String {
        return "삼각형의 넓이 : \(size)"
    }
    
}

