//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Shape, Equatable {
    private(set) var x: Int
    private(set) var y: Int
    var points: [MyPoint] {
        return [self]
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public static func ==(lhs: MyPoint, rhs: MyPoint) -> Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y)
    }
}
