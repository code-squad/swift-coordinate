//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private(set) var pointA = MyPoint(x: 0, y: 0)
    private(set) var pointB = MyPoint(x: 0, y: 0)
    
    init(x: MyPoint, y: MyPoint) {
        pointA = x
        pointB = y
    }
    
    var distance: Double {
        return sqrt( pow((Double(pointA.x) - Double(pointB.x)), 2) +
                        pow((Double(pointA.y) - Double(pointB.y)), 2))
    }
}

extension MyLine: Shape {
    var vertices: [CoordinatePresentable] {
        return [pointA, pointB]
    }
    
    var description: String? {
        return "두 점 사이의 거리는 \(distance)"
    }
}
