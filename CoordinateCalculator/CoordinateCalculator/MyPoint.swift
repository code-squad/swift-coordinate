//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Equatable {
    var x = 0
    var y = 0
}

extension MyPoint {
    
    init(_ myPoints: [MyPoint]) {
        self.x = myPoints[0].x
        self.y = myPoints[0].y
    }
}

extension MyPoint: FigureCalculatable {
    func calculateDistance() -> Double {
        return 0.0
    }
}

// ^^는 제곱을 하는 사용자 정의 연산자
postfix operator ^^

postfix func ^^(value: Double) -> Double {
    return value * value
}
