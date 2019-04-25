//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by cushy k on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private var x: Int
    private var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    var positionX: Int {
        return x
    }

    var positionY: Int {
        return y
    }
}
