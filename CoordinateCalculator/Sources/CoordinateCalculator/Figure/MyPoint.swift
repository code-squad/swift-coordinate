//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 3..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private(set) var x: Int = 0
    private(set) var y: Int = 0
    
    init() {}
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension MyPoint: Figurable {
    init(points: [MyPoint]) {
        self.x = points[0].x
        self.y = points[0].y
    }
    
    func calculate() -> Double {
        return 0
    }
    
    var points: [MyPoint] {
        return [MyPoint(x: self.x, y:self.y)]
    }
    
    func messageToCalculate() -> String {
        return ""
    }
}
