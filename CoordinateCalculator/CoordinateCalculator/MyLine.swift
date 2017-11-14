//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: MyShape {
    private(set) var pointA = MyPoint(x: 0, y: 0)
    private(set) var pointB = MyPoint(x: 0, y: 0)
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func calculateOfPosition() -> [MyPoint] {
        return [pointA, pointB]
    }
    
    func calculateOfLength() -> Double {
        return sqrt(abs(pow(Double(pointA.x - pointB.x),2) + pow(Double(pointA.y - pointB.y),2)))
    }
    
    func resultOfMyShape() -> Double {
        return calculateOfLength()
    }
    
    var resultDescription: String = {
        return "길이"
    }()

}
