//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyShape {
    private(set) var x = 0
    private(set) var y = 0
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func calculateOfPosition() -> [MyPoint] {
        return [MyPoint(x: x, y: y)]
    }
 
    func resultOfMyShape() -> Double {
        return 0
    }
}
