//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine:Point {
    private(set) var points: [MyPoint] = []
    
    private var pointA:MyPoint
    private var pointB:MyPoint
    
    init(pointA:MyPoint, pointB:MyPoint){
        self.pointA = pointA
        self.pointB = pointB
        self.points = [self.pointA,self.pointB]
    }
    
    func distance() -> String {
        return " 두 점 사이의 거리는 \(sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2)))"
    }
}
