//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    /// 두 점 사이의 거리를 리턴
    func distanceBetween()->Double {
        return sqrt(Double((self.pointA.x - self.pointB.x)^2 + (self.pointA.y - self.pointB.y)^2))
    }
}
