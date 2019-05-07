//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Drawable {
    
    private let pointA: MyPoint
    private let pointB: MyPoint
    
    var points: [MyPoint] {
        return [pointA, pointB]
    }
    
    var distance: Double {
        let distanceX = pointA.x - pointB.x
        let distanceY = pointA.y - pointB.y
        
        let result = sqrt(Double(distanceX*distanceX + distanceY*distanceY))
        
        return result
    }
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}
