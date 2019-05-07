//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Drawable, CustomStringConvertible {
    
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
    
    var description: String {
        return "두 점 사이의 거리는 \(self.distance)"
    }
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}
