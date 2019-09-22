//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 공명진 on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Cocoa

struct MyPoint {
    private(set) var x = 0
    private(set) var y = 0
    
    var point: CGPoint {
        get {
            return CGPoint(x: x, y: y)
        }
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
