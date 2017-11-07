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
    
    var coordinates: MyPoint {
        get {
            return MyPoint(x: self.x * 2 + 3, y: abs(self.y - 24) + 1)
        }
    }
}
