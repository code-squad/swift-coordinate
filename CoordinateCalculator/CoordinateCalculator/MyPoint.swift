//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by cushy k on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private(set) var positionX: Int
    private(set) var positionY: Int

    init(x: Int, y: Int) {
        self.positionX = x
        self.positionY = y
    }
}
