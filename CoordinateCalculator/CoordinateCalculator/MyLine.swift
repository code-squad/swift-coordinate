//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    private var lineLength: Double { return
        sqrt(pow(Double(pointA.x - pointB.x),2) + pow(Double(pointA.y - pointB.y),2)) }
    
    private let explain = "두 점 사이의 거리는 "
    
    func getValue() -> String {
        return "\(explain)\(lineLength)"
    }
    
}
