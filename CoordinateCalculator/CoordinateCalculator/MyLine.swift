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
    func distanceBetweenPonints()->String {
        let width = self.pointA.x - self.pointB.x
        let hight = self.pointA.y - self.pointB.y
        let distance = sqrt(Double((width * width) + (hight * hight)))
        return ("두 점 사이의 거리는 \(distance)")
    }
    
    /// 프로토콜을 준수
    func getPoints() -> [MyPoint] {
        return [self.pointA,self.pointB]
    }
    func getMessage() -> String {
        return distanceBetweenPonints()
    }
}
