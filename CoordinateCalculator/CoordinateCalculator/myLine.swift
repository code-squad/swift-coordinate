//
//  myLine.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// 두 좌표를 받아와서 거리를 계산하고 좌표 정보를 전달해주는 일을 책임지는 구조체
struct MyLine {
    public var pointA = MyPoint(x: Int(), y: Int())
    public var pointB = MyPoint(x: Int(), y: Int())
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    // 거리를 계산하는 메소드
    public func calculateDistance() -> Double {
        let dx = pointA.x-pointB.x, dy = pointA.y-pointB.y
        let square = Double((dx * dx) + (dy * dy))
        let result = round(square.squareRoot()*1000) / 1000
        return result
    }
}
