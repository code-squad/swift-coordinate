//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private(set) var x: Float
    private(set) var y: Float
    
    init() {
        self.x = 0
        self.y = 0
    }
    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}

extension MyPoint: Comparable {
    
    static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
        if lhs.x != rhs.x { return lhs.x < rhs.x }
        else { return lhs.y < rhs.y}
    }
    
    static func == (lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
