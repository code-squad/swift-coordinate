//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Drawable {
    
    private(set) var pointA = MyPoint(x: 0, y: 0)
    private(set) var pointB = MyPoint(x: 0, y: 0)
    
    var points: [MyPoint] {
        return [pointA, pointB]
    }
    
    func calculateDistance() -> Double {
        
        let distanceX = pointA.x - pointB.x
        let distanceY = pointA.y - pointB.y
        
        let distance = sqrt(Double(distanceX*distanceX + distanceY*distanceY))
        
        return distance
    }
}
