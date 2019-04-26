//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine{
    let pointA : MyPoint
    let pointB : MyPoint
    
    init(_ pointA:MyPoint,pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    var lengthOfLine: Double { return self.getDistancebetweenDots(self.pointA, self.pointB)}
    
    func getDistancebetweenDots(_ pointA:MyPoint,_ pointB:MyPoint)->Double{
        return sqrt(pow(Double(pointA.x - pointB.x),2)+pow(Double(pointA.y - pointB.y),2))
    }
}

