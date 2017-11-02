//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Figure {
    private(set) var x = 0
    private(set) var y = 0
    private(set) var points: [MyPoint] = []
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.points = [self]
    }
}


