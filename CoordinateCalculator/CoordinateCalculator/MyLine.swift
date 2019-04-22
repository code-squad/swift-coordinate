//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private(set) var pointA = MyPoint(x: 0, y: 0)
    private(set) var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA: MyPoint, pointB: MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
    func lengthCalcul() -> Double {
        let betweenLength = sqrt(pow(abs(Double(pointA.x - pointB.x)),2)) + pow(abs(Double(pointA.y - pointB.y)),2)
        return betweenLength
    }
}
