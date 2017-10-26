//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private(set) var x: Int
    private(set) var y: Int
    
    init() {
        self.x = 0
        self.y = 0
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension MyPoint: Figure { }

extension MyPoint: Comparable {
    
    static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
        if lhs.x != rhs.x { return lhs.x < rhs.x }
        else { return lhs.y < rhs.y}
    }
    
    static func == (lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
