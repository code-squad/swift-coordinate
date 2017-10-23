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
    
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
}
