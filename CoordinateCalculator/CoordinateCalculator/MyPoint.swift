//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Drawable, Hashable {
    private (set) var x = 0
    private (set) var y = 0
    var points: [MyPoint] {
        return [self]
    }
}
