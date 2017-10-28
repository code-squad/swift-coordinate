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
        let result = sqrt( Double((self.pointA.x-self.pointB.x)^2 + (self.pointA.y-self.pointB.y)^2) )
        return result
    }
}
