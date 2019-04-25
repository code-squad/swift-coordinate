//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hw on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private var pointA = MyPoint()
    private var pointB = MyPoint()
    
    init( pointList: [MyPoint] ){
        pointA = pointList[0]
        pointB = pointList[1]
    }
        
    var distance : Double {
        get{
            let xDistance = pointA.x - pointB.x
            let yDistance = pointA.y - pointB.y
            return sqrt(Double ((xDistance * xDistance) + (yDistance * yDistance)))
        }
    }
}
