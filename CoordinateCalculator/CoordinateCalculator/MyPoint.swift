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
    
    func draw() -> String {
        return "\(ANSICode.cursor.move(row:25-y, col: x*2+3))•\(ANSICode.cursor.move(row:27, col: 0))"
    }
}



