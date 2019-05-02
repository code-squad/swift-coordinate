//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: AxisDrawable, ValueComputable {
    func getPoints() -> [MyPoint] {
        var points = lineAB.getPoints()
        var pointBC = lineBC.getPoints()
        let pointC = pointBC.remove(at: pointBC.count-1)
        points.append(pointC)
        return points
    }
    
    var description: String {
        return "삼각형의 넓이는 "
    }
    
    func getComputedValue() -> Double {
        //
    }
    
    var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    
    init(pairA: Pair, pairB: Pair, pairC: Pair) {
        let pointA = MyPoint(x: pairA.x, y: pairA.y)
        let pointB = MyPoint(x: pairB.x, y: pairB.y)
        let pointC = MyPoint(x: pairC.x, y: pairC.y)
        self.init(pointA: pointA, pointB: pointB, pointC: pointC)
    }
}

