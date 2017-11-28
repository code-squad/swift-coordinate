//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint:  MyShape{
    var type: SyntaxChecker.Shape
    
    private (set) var x = 0
    private (set) var y = 0
    init(x: Int, y: Int) {
        self.type = SyntaxChecker.Shape.point
        self.x = x * 2 + 3
        self.y = abs(y - 24) + 1
    }
    
    
    
}
