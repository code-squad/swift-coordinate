//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 04/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Shape {
    private(set) var x = 0
    private(set) var y = 0
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
    
    var points: [MyPoint] {
        return [self]
    }
}
