//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    init?(pointA: MyPoint, pointB: MyPoint) {
        guard pointA != pointB else {
            return nil
        }
        
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func distance() -> Double {
        return sqrt( pow(Double(pointA.X - pointB.X), 2.0) + pow(Double(pointA.Y - pointB.Y), 2.0) )
    }
    
}

extension MyLine : Shapable {
    
    func pointToShow() -> [Point] {
        var linePoints = Array<Point>()
        
        linePoints.append(self.pointA.pointToShow()[0])
        linePoints.append(self.pointB.pointToShow()[0])
        
        return linePoints
    }
    
    func shapeDependentResult() -> String {
        let distance = self.distance()
        
        return "두 점 사이 거리는 \(distance)"
    }
}
