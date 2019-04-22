//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA: MyPoint, pointB: MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
    func calcul() {
        print("두 점사이의 거리는\(sqrt(pow(abs(Double(pointA.x - pointB.x)),2)) + pow(abs(Double(pointA.y - pointB.y)),2))")
    }
}
