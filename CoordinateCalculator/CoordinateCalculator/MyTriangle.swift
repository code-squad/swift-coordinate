//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 28/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle:Drawable,HasArea {
    
    var points:[MyPoint]
    
    var calculateArea:Double {
        let a = (points[1].x - points[0].x) * (points[2].y - points[0].y)
        let b = (points[2].x - points[0].x) * (points[2].y - points[0].y)
        return Double(abs(a-b)) / 2.0
    }
    
    init(points:[MyPoint]) {
        self.points = points
    }
    
}
