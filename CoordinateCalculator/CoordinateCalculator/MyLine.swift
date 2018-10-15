//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 12/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: CalculableShape {
    private(set) var pointA = MyPoint(x: 0, y: 0)
    private(set) var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    var points: [MyPoint] {
        return [pointA, pointB]
    }
    
    var calculationMessage: String {
        return "두 점 사이의 거리는"
    }
    
    func calculate() -> Double {
        return sqrt(pow(Double(pointA.x-pointB.x), 2) + pow(Double(pointA.y-pointB.y), 2))
    }
}
