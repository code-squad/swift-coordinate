//
//  Point.swift
//  CoordinateCalculator
//
//  Created by hw on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Point {
    private (set) var x: Int
    private (set) var y: Int
    init(x: Int = 0, y: Int = 0){
        self.x = x
        self.y = y
    }
}
