//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Equatable {
    var x = 0
    var y = 0
}

extension MyPoint: CoordinatePresentable {
    var coordinate: (row: Int, col: Int) {
        return ( CoordinateConstants.yAxisEndPos - (self.y * CoordinateConstants.coordinatesMagnifyingFactor.y),
                 (self.x + CoordinateConstants.xAxisStartPos) * CoordinateConstants.coordinatesMagnifyingFactor.x)
    }
}

extension MyPoint: Shape {
    var vertices: [CoordinatePresentable] {
        return [self as CoordinatePresentable]
    }
}
