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
    private var x = 0
    private var y = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    init(pointA: MyPoint, pointB: MyPoint) {
        
    }
}
