//
//  PointCreator.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PointCreator {
    static func creatPoint(_ points:Points) -> [MyPoint] {
        var myPoints:[MyPoint] = []
        
        for index in 0..<points.count{
              myPoints.append(MyPoint(x: points[index].x, y: points[index].y))
        }
        return myPoints
    }
}
