//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Figure {
    var x = 0
    var y = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    init(_ points: [MyPoint]) {
        self.x = points[0].x
        self.y = points[0].y
    }
}



