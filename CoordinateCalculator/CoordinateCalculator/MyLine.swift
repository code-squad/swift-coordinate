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
    
    var shapeInformation : Double {
        get{
            let xDistance = pointA.x - pointB.x
            let yDistance = pointA.y - pointB.y
            let distance = sqrt(Double ((xDistance * xDistance) + (yDistance * yDistance)))
                                .rounded(.toNearestOrAwayFromZero)
            return distance
        }
    }
    var mentionOfShapeInformation: String {
        get {
            return "두 점 사이의 거리는 \(shapeInformation)"
        }
    }
    
    func getDrawablePointList() -> [MyPoint] {
        var pointList: [MyPoint]  = [MyPoint]()
        pointList.append(pointA)
        pointList.append(pointB)
        return pointList
    }
    
    init(pointA : MyPoint, pointB : MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
    
}
