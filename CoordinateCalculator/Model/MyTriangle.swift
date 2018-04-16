//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 14..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

struct MyTriangle: Equatable {
    var lineAB = MyLine( MyPoint(), MyPoint())
    var lineBC = MyLine( MyPoint(), MyPoint())
    var lineAC = MyLine( MyPoint(), MyPoint())
    
    init( _ pointA: MyPoint, _ pointB: MyPoint, _ pointC: MyPoint) {
        self.lineAC = MyLine(pointA, pointB)
        self.lineBC = MyLine(pointB, pointC)
        self.lineAC = MyLine(pointA, pointC)
    }
    
    init(_ points: [MyPoint]) {
        self.lineAB = MyLine(points[0], points[1])
        self.lineBC = MyLine(points[1], points[2])
        self.lineAC = MyLine(points[0], points[2])
    }
}
