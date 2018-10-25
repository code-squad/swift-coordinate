//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension Int {
    func square() -> Int {
        return self * self
    }
}

struct MyLine : Figure {
    private let pointA : MyPoint
    private let pointB : MyPoint
    
    init(pointA:MyPoint, pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    private func distanceBetween() -> Double {
        let x = self.pointA.readX() - self.pointB.readX()
        let y = self.pointA.readY() - self.pointB.readY()
        let squareSumFromXY = Double(x.square() + y.square())
        return squareSumFromXY.squareRoot()
    }
    
    func readPoints() -> [(Int, Int)] {
        return [pointA.xy,pointB.xy]
    }
    
    func readDetailInfo() -> Double? {
        return distanceBetween()
    }
}
