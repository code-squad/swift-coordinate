//
//  Myline.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine:Drawable {
    var pointNumber: Int = 2
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    var calculateDistance:Double {
        return sqrt(pow(Double(pointA.x - pointB.x),2) + pow(Double(pointA.y - pointB.y),2))
    }
    
    init(pointA:MyPoint, pointB:MyPoint, pointNumber:Int) {
        self.pointA = pointA
        self.pointB = pointB
        self.pointNumber = pointNumber
    }
}
