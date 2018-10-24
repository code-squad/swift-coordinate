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
    
    init(points: (MyPoint, MyPoint)) {
        self.pointA = points.0
        self.pointB = points.1
    }
    
    // 거리를 계산하기 위해 각 좌표끼리 차이를 구하는 메소드
    private func differenceEachPoint() -> (Int, Int) {
        return (pointA.x-pointB.x, pointA.y-pointB.y)
    }
    
    // 거리를 계산하는 메소드
    public func calculateDistance() -> Double {
        let gabs = differenceEachPoint()
        let result = Double((gabs.0 * gabs.0) + (gabs.1 * gabs.1))
        return round(result.squareRoot()*1000) / 1000
    }
    
    // 구조체의 정보를 OutputView에 넘겨주는 메소드
    public func delievePoints() -> (MyPoint, MyPoint) {
        return (first: pointA, second: pointB)
    }
}
