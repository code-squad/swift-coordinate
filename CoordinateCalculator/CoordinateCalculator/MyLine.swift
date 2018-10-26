//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension Int {
    func squared() -> Int {
        return self * self
    }
}

struct MyLine : Figure {
    private let pointA : MyPoint
    private let pointB : MyPoint
    
    init(_ pointA:MyPoint,_ pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func distanceBetween() -> Double {
        let x = self.pointA.readX() - self.pointB.readX()
        let y = self.pointA.readY() - self.pointB.readY()
        let squareSumFromXY = Double(x.squared() + y.squared())
        return squareSumFromXY.squareRoot()
    }
    
    func readPoints() -> [MyPoint] {
        return [pointA,pointB]
    }
}
