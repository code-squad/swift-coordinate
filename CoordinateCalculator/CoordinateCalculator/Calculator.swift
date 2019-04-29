//
//  Calculator.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Calculator {
    
    static func calculateDistance(of points: MyLine) -> Double {
        
        let distanceX = points.pointA.x - points.pointB.x
        let distanceY = points.pointA.y - points.pointB.y
        
        let distance = sqrt(Double(distanceX*distanceX + distanceY*distanceY))
        
        return distance
    }
}
