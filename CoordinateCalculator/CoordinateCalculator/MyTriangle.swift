//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private var lineAB : MyLine!
    private var lineBC : MyLine!
    private var lineAC : MyLine!
    
    init(lineAB: MyLine, lineBC: MyLine, lineAC: MyLine) {
        self.lineAB = lineAB
        self.lineBC = lineBC
        self.lineAC = lineAC
    }
    
    init?(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        guard
            let lineAB = MyLine(pointA: pointA, pointB: pointB),
            let lineBC = MyLine(pointA: pointB, pointB: pointC),
            let lineAC = MyLine(pointA: pointA, pointB: pointC) else {
            return nil // same points
        }
        
        self.init(lineAB: lineAB, lineBC: lineBC, lineAC: lineAC)
    }
    
    func area() -> Double {
        let a = lineAB.distance()
        let b = lineBC.distance()
        let c = lineAC.distance()
        
        let s : Double = (a + b + c) / 2.0
        let S = sqrt(s * (s - a) * (s - b) * (s - c))
        
        return S
    }
}

extension MyTriangle : Shapable {
    
    func pointToDraw() -> [PointDrawable] {
        
        let drawablePointA = self.lineAB.pointToDraw()[0]
        let drawablePointB = self.lineAB.pointToDraw()[1]
        let drawablePointC = self.lineBC.pointToDraw()[1]
        
        return [drawablePointA, drawablePointB, drawablePointC]
    }
    
    func shapeDependentResult() -> String {
        let area = self.area()

        return "삼각형의 넓이는 \(area)"
    }
    
}
