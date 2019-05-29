//
//  Myline.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine:Drawable,HasArea {
    private(set) var pointA : MyPoint
    private(set) var pointB : MyPoint
    
    var points:[MyPoint] {
        return [pointA,pointB]
    }
    
    var calculateArea:Double {
        return sqrt(pow(Double(pointA.x - pointB.x),2) + pow(Double(pointA.y - pointB.y),2))
    }
    
    init(pointA:MyPoint, pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}
