//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
    
    init(_ point:PointTuple) {
        self.x = point.0
        self.y = point.1
    }
}
