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
    
}

extension MyLine : Shapable {
    
    func pointToShow() -> [Point] {
        var linePoints = Array<Point>()
        
        linePoints.append((xPos: self.pointA.xPosToShow(), yPos: self.pointA.yPosToShow()))
        linePoints.append((xPos: self.pointB.xPosToShow(), yPos: self.pointB.yPosToShow()))
        
        return linePoints
    }
    
    func shapeDependentResult() -> String {
        let distance = sqrt( pow(Double(pointA.X - pointB.X), 2.0) + pow(Double(pointA.Y - pointB.Y), 2.0) )
        
        return "두 점 사이 거리는 \(distance)"
    }
    
}
