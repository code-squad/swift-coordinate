//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension Int {
    mutating func square() -> Int {
        return self * self
    }
}

struct MyLine : Figure {
    private(set) var pointA : MyPoint
    private(set) var pointB : MyPoint
    
    func distanceBetween() -> Double {
        var x = self.pointA.x - self.pointB.x
        var y = self.pointA.y - self.pointB.y
        let squareSumFromXY = Double(x.square() + y.square())
        return squareSumFromXY.squareRoot()
    }
    
    func callShow() {
        OutputView.show(point: self.pointA.xy)
        OutputView.show(point: self.pointB.xy)
        print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit + 3, col: 1))")
        print("두 점 사이 거리는 \(distanceBetween())")
    }
}
