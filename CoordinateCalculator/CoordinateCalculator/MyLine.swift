//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    
    init?(pointA: MyPoint, pointB: MyPoint) {
        guard pointA != pointB else {
            return nil
        }
        
        self.pointA = pointA
        self.pointB = pointB
    }
    
    init?(pointA: Point, pointB: Point) {
        self.init(pointA: MyPoint(point: pointA), pointB: MyPoint(point: pointB))
    }
    
    func distance() -> Double {
        return sqrt( pow(Double(pointA.X - pointB.X), 2.0) + pow(Double(pointA.Y - pointB.Y), 2.0) )
    }
    
    func isStraight() -> Bool {
        if (pointA.X == pointB.X) || (pointA.Y == pointB.Y) {
            return true
        }
        else {
            return false
        }
    }
    
    func isDiagonal() -> Bool {
        if (pointA.X != pointB.X) && (pointA.Y != pointB.Y) {
            return true
        }
        else {
            return false
        }
    }
    
}

extension MyLine : Shapable {
    
    func pointToDraw() -> [PointDrawable] {
        
        let drawablePointA = self.pointA.pointToDraw()[0]
        let drawablePointB = self.pointB.pointToDraw()[0]
        
        return [drawablePointA, drawablePointB]
    }
    
    func shapeDependentResult(display: (Shapable, String, Any) -> ()) {
        let distance = self.distance()
        
        display(self, "두 점 사이 거리는 ", distance)
    }
}
