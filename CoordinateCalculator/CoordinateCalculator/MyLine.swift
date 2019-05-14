//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private (set) var pointA = MyPoint(x: 0, y: 0)
    private (set) var pointB = MyPoint(x: 0, y: 0)
    
    private var lineLength: Double { return
        sqrt(pow(Double(pointA.x - pointB.x),2) + pow(Double(pointA.y - pointB.y),2)) }
    
    func getValue() -> Double {
        return lineLength
    }
    
}
