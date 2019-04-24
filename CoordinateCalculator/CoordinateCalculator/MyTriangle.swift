//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private(set) var lineAB = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    private(set) var lineBC = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    private(set) var lineAC = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine.init(startPoint: pointA, endPoint: pointB)
        self.lineBC = MyLine.init(startPoint: pointB, endPoint: pointC)
        self.lineAC = MyLine.init(startPoint: pointA, endPoint: pointC)
    }
}
