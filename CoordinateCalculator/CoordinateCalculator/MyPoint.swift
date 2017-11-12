//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyShape {
    var type: Figure
    var x = 0
    var y = 0
    init(x: Int, y: Int) {
        self.type = Figure.point
        self.x = x
        self.y = y
    }
}
