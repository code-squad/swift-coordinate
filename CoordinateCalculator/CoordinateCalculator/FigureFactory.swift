//
//  FigureMaker.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory: Figurable {
    
    private var myPoints: [MyPoint]
    
    init(_ myPoints: [MyPoint]) {
        self.myPoints = myPoints
    }
    
    func makeFigure() {
        switch self.myPoints.count {
        case 1:
            // 한개면 점
        case 2:
            // 두개면 직선
        default:
            // 예외의 경우
        }
    }
}

protocol Figurable {
    func calculateDistance() -> Double
}


// ^^는 제곱을 하는 사용자 정의 연산자
postfix operator ^^

postfix func ^^(value: Double) -> Double {
    return value * value
}
