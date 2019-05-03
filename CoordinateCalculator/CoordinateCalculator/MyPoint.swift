//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by hw on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Pointable {
    private (set) var x: Int
    private (set) var y: Int
    
    func getDrawablePointList() -> [MyPoint] {
        return [self]
    }

    init(x: Int = 0, y: Int = 0){
        self.x = x
        self.y = y
    }
    
    init(pointList: [Pair]) {
        self.x = pointList[0].x
        self.y = pointList[0].y
    }

}
