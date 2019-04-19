//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)

    func calculateLength() -> Double {
        let legA = pow(Double(pointA.x - pointB.x), 2)
        let legB = pow(Double(pointA.y - pointB.y), 2)
        
        return sqrt(legA + legB)
    }
}
