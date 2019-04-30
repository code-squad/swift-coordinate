//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by hw on 25/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Linable {
    private (set) var pointA: MyPoint = MyPoint()
    private (set) var pointB: MyPoint = MyPoint()
    
    var myLineInformation : Double {
        get{
            let xDistance = pointA.x - pointB.x
            let yDistance = pointA.y - pointB.y
            let distance = sqrt(Double ((xDistance * xDistance) + (yDistance * yDistance)))
            return distance
        }
    }
    
    func getDrawablePointList() -> [MyPoint] {
        var pointList: [MyPoint]  = [MyPoint]()
        pointList.append(pointA)
        pointList.append(pointB)
        return pointList
    }
    
    init(pointList: [Pair]) {
        pointA = MyPoint(x: pointList[0].x, y: pointList[0].y)
        pointB = MyPoint(x: pointList[1].x, y: pointList[1].y)
    }
    
    init(pointA : MyPoint, pointB : MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
    
}
