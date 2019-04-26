//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hw on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private (set) var pointA = MyPoint()
    private (set) var pointB = MyPoint()
    
    init( pointList: [Pair] ){
        pointA = MyPoint.init(x: pointList[0].x, y: pointList[0].y)
        pointB = MyPoint.init(x: pointList[1].x, y: pointList[1].y)
    }
        
    var distance : Double {
        get{
            let xDistance = pointA.x - pointB.x
            let yDistance = pointA.y - pointB.y
            return sqrt(Double ((xDistance * xDistance) + (yDistance * yDistance)))
        }
    }
}
