//
//  Myline.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine:Drawable,HasArea {
    
    var points:[MyPoint]
    
    var calculateArea:Double {
        return sqrt(pow(Double(points[0].x - points[1].x),2) + pow(Double(points[0].y - points[1].y),2))
    }
    
    init(points:[MyPoint]) {
        self.points = points
    }
}
