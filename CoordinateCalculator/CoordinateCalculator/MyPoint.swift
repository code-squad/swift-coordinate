//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol AxisDrawable {
    func getPoints() -> [MyPoint]
}

struct MyPoint: AxisDrawable {
    var x = 0
    var y = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(using numbers: [Int]) {
        x = numbers[0]
        y = numbers[1]
    }
    
    func getPoints() -> [MyPoint] {
        return [self]
    }
}


struct MyLine: AxisDrawable {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    
    init(using numbers: [Int]) {
        pointA = MyPoint(x: numbers[0], y: numbers[1])
        pointB = MyPoint(x: numbers[2], y: numbers[3])
    }
    
    func getPoints() -> [MyPoint] {
        return [pointA, pointB]
    }
}
