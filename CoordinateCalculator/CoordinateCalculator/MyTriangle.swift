//
//  ㅎㅎ.swift
//  CoordinateCalculator
//
//  Created by JH on 29/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: DrawableShape {
    
    private (set) var lineAB: MyLine
    private (set) var lineBC: MyLine
    private (set) var lineAC: MyLine
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(startPoint: pointA, endPoint: pointB)
        self.lineBC = MyLine(startPoint: pointB, endPoint: pointC)
        self.lineAC = MyLine(startPoint: pointA, endPoint: pointC)
    }
    
    var drawablePoints: [MyPoint] {
        return [lineAB.startPoint, lineBC.startPoint, lineAC.endPoint]
    }
    
    func calcurateTriangle() -> Double {
        
        let a = self.lineAB.distance()
        let b = self.lineBC.distance()
        let c = self.lineAC.distance()
        
        let s = (a+b+c)/2
        let triangleArea = sqrt(s*(s-a)*(s-b)*(s-c))
        
        return triangleArea
    }
    
}
