//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Figure, Ment {
    private(set) var pointA = MyPoint(x: 0, y: 0)
    private(set) var pointB = MyPoint(x: 0, y: 0)
    private(set) var length: Double = 0.0
    
    init(x: Int = 0, y: Int = 0) {
        self.pointA = MyPoint(x: x, y: y)
        self.pointB = MyPoint(x: x, y: y)
    }
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
        self.length = calculateLength()
    }

    private func calculateLength () -> Double {
        let legA = pow(Double(pointA.x - pointB.x), 2)
        let legB = pow(Double(pointA.y - pointB.y), 2)
        
        return sqrt(legA + legB)
    }
    
    func draw() -> [MyPoint] {
        return [pointA, pointB]
    }
    
    func getMent() -> [String: Double] {
        return ["두 점 사이의 거리는": length]
    }
    
}
