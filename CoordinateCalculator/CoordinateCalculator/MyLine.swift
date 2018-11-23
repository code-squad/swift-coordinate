//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Elena on 02/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//


import Foundation

struct MyLine: twoPointProtocol {
    
    private (set) var pointA = MyPoint(x: 0, y: 0)
    private (set) var pointB = MyPoint(x: 0, y: 0)

    func getLine() -> MyLine {
        return MyLine.init(pointA, pointB)
    }
    
    var resultDescription: String {
        return "두 점 사이의 거리는" + String(getLineDistance())
    }
    
    private func getLineDistance() -> Double {
        return sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2))
    }
    
    init(_ pointA: MyPoint,_ pointB: MyPoint ) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
}

