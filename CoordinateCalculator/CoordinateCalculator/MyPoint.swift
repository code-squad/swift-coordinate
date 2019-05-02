//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Drawable {

    let x: Int
    let y: Int

    var points: [MyPoint] {
        return [self]
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
