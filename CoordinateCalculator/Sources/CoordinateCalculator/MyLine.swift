//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 29..
//

import Foundation

struct MyLine{
    var pointA = MyPoint()
    var pointB = MyPoint()
    
    // 두 점 사이 거리 계산.
    func calculateDistance() -> Double{
        return sqrt( Double( (self.pointB.x-self.pointA.x)^2 + (self.pointB.y-self.pointA.y)^2 ) )
    }
}
