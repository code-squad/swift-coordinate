//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 3..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Figurable {
    private(set) var x: Int = 0
    private(set) var y: Int = 0
    private(set) var points: [MyPoint]
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.points = []
    }
    
    init(points: [MyPoint]) {
        self.x = points[0].x
        self.y = points[0].y
        self.points = points
    }
    
    func calculate() -> Double {
        return 0
    }
}
