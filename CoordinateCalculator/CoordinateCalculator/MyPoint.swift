//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private(set) var x: Int = 0
    private(set) var y: Int = 0
    
    init() {
        self.x = 0
        self.y = 0
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension MyPoint: AxisDrawable {
    var points: [MyPoint] {
        return [self]
    }
}

extension MyPoint: Hashable {
    static func ==(lpoint: MyPoint, rpoint: MyPoint) -> Bool {
        return lpoint.x == rpoint.x && lpoint.y == rpoint.y
    }
    
    func hash(into haser: inout Hasher) {
        haser.combine(x)
        haser.combine(y)
    }
}
