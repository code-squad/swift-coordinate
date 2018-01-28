//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 9..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyShape {
    
    var x = 0
    var y = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(_ coordinates: [Int]) {
        self.x = coordinates[0]
        self.y = coordinates[1]
    }
    
    func drawPoint() -> [MyPoint] {
        return [self]
    }
    
}


