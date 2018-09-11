//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyPointConvertible{
    
    func createCoordinate() -> [MyPoint] {
        return [self]
    }
    
    private (set) var x: Int = 0
    private (set) var y: Int = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(_ points : [MyPoint]) {
        self.x = points[0].x
        self.y = points[0].y
    }
}
