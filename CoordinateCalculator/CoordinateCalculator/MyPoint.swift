//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: FigureProtocol {
    var points: [Point]
    
    var pointsForDisplay: [Point] {
        return points.map { Point(x: $0.x * 2 + 3, y: 25 - $0.y)}
    }
    
    init(_ points: [Point] ) {
        self.points = points
    }
}
