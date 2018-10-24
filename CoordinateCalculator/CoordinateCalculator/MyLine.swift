//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Shape{
    var points : [Position] = []

    init(_ pointA: Position, _ pointB: Position){
        points.append(pointA)
        points.append(pointB)
    }
    
    // Line의 길이 계산
    func calculateDistance() -> Double{
        return sqrt(pow((points[0].xPosition-points[1].xPosition), 2) + pow((points[0].yPosition-points[1].yPosition), 2))
    }
}
