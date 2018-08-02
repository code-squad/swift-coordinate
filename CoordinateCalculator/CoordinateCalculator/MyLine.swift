//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 24..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine:ShapeProtocol,BasicProtocol,Equatable {
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    
    public var a:MyPoint {
        get {
            return pointA
        }
    }
    public var b:MyPoint {
        get {
            return pointB
        }
    }
    
    init(pointA:MyPoint , pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    init(points:[MyPoint]) {
        self.pointA = points[0]
        self.pointB = points[1]
    }
    
    private func convertSquare(number:Int) -> Double {
        return Double(number * number)
    }
    
    public func calculate() -> Double {
        // 두 점 사이 거리는 제곱근((A.x - B.x)^제곱 + (A.y - B.y)^제곱) 공식으로 계산할 수 있다.
        // (A.x - B.x) * (A.x - B.x) + (A.y - B.y) * (A.y - B.y)
        let valueX = convertSquare(number: self.pointA.valueX - self.pointB.valueX)
        let valueY = convertSquare(number: self.pointA.valueY - self.pointB.valueY)
        let distanceOfPoint = sqrt(Double(valueX + valueY))
        return distanceOfPoint
    }
    
    public func message() -> String {
        return "두 점 사이의 거리는 "
    }
    
}
