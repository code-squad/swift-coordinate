//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : ShapeByPoints {
    
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    func getXYPosArrayToShow() -> [XYPosTuple] {
        
        let lineXYArray = [
        (xPos: self.pointA.xPosToShow(), yPos: self.pointA.yPosToShow()),
        (xPos: self.pointB.xPosToShow(), yPos: self.pointB.yPosToShow())
        ]
        return lineXYArray
    }
    
    func getShapeDependentResult() -> String {
        let distance = sqrt( pow(Double(pointA.X - pointB.X), 2.0) + pow(Double(pointA.Y - pointB.Y), 2.0) )
        
        return "두 점 사이 거리는 \(distance)"
    }
    
}
