//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
}

extension MyLine: MyShape {
    
    //두 점 사이 거리는 제곱근((A.x - B.x)^제곱 + (A.y - B.y)^제곱) 공식으로 계산할 수 있다.
    func calculate() -> Double {
        let subtractX = (pointA.x - pointB.x).magnitude
        let subtractY = (pointA.y - pointB.y).magnitude
        let cal = Double(subtractX^2 + subtractY^2)
        let distance = sqrt(cal)
        return distance
    }
}
