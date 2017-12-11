//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
    
    init(x : Int, y : Int) {
        self.x = x
        self.y = y
    }
    
    init(_ points : [Int]) {
        self.x = points[0]
        self.y = points[1]
    }
    
}
