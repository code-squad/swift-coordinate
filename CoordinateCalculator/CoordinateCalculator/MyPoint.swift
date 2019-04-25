//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Figure {
    private(set) var x = 0
    private(set) var y = 0
    
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
    
    func draw() -> [(Int, Int)] {
        return [(x, y)]
    }
    
    func ment() -> String {
        return ""
    }
}



