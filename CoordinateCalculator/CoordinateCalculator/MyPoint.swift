//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Drawable {
    func point() -> [MyPoint] {
        return [self]
    }
    
    private(set) var x = 0
    private(set) var y = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
