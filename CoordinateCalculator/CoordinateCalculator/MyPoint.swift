//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private (set) var x: Int = 0
    private (set) var y: Int = 0
    
    var col: Int {
        return 2 * x + 3
    }
    
    var row: Int {
        return 25 - y
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
