//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Points {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    /// 두 점 사이의 거리를 리턴
    func distanceBetween()->Double {
        let width = self.pointA.x - self.pointB.x
        let hight = self.pointA.y - self.pointB.y
        return sqrt(Double((width * width) + (hight * hight)))
    }
    
    수
    func getPoints() -> [MyPoint] {
        return [self.pointA,self.pointB]
    }
}
