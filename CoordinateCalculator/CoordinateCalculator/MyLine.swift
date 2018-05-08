//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Points {
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    
    /// 마이포인트를 받아서 생성
    init (pointA : MyPoint,pointB : MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }    
    
    /// 두 점 사이의 거리를 리턴
    func distanceBetweenPonints()->Double {
        let width = self.pointA.getXAxis() - self.pointB.getXAxis()
        let hight = self.pointA.getYAxis() - self.pointB.getYAxis()
        let distance = sqrt(Double((width * width) + (hight * hight)))
        return distance
    }
    
    /// 프로토콜을 준수
    func getPoints() -> [MyPoint] {
        return [self.pointA,self.pointB]
    }
    func getMessage() -> String {
        return ("두 점 사이의 거리는 \(distanceBetweenPonints())")
    }
}
