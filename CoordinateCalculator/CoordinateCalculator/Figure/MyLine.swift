//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Figure{
 
    var description: String { return "두 점 사이의 거리는 \(distanceOfPoints)"}
    
    private(set) var pointA : MyPoint
    private(set) var pointB : MyPoint
    var distanceOfPoints: Double {
        let xd = pow(Double(pointA.x - pointB.x),2)
        let yd = pow(Double(pointA.y - pointB.y),2)
        return sqrt(xd+yd)
    }
    
    init(_ pointA:MyPoint,_ pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func getPoints() -> [MyPoint] {
        return [pointA,pointB]
    }
    
    
}

