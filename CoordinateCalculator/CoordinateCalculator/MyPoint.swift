//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Drawable, Hashable, Equatable, Comparable {
    private (set) var x = 0
    private (set) var y = 0
    var points: [MyPoint] {
        return [self]
    }
    
    static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.x < rhs.x || lhs.y < rhs.y
    }
}
