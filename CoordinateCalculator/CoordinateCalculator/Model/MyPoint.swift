//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x: Int
    var y: Int
    init() {
        self.init(x: 0, y: 0)
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
