//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 13..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private(set) var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())  //좌변
    private(set) var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())  //우변
    private(set) var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())  //밑변
}

extension MyTriangle: Figurable {
    init(points: [MyPoint]) {
        self.lineAB = MyLine(pointA: points[0], pointB: points[1])
        self.lineAC = MyLine(pointA: points[0], pointB: points[2])
        self.lineBC = MyLine(pointA: points[1], pointB: points[2])
    }
    
    func calculate() -> Double {
        // 삼각형 넓이 계산
        return calculateArea()
    }
    
    private func calculateArea() -> Double {
        let x1: Int = points[0].x
        let x2: Int = points[1].x
        let x3: Int = points[2].x
        let y1: Int = points[0].y
        let y2: Int = points[1].y
        let y3: Int = points[2].y
        let sum = abs((x1*y2 + x2*y3 + x3*y1) - (x1*y3 + x3*y2 + x2*y1))
        return Double(sum) / 2
    }
    
    var points: [MyPoint] {
        return [lineAB.pointA, lineAB.pointB, lineAC.pointB]
    }
    
    func messageToCalculate() -> String {
        return "삼각형의 넓이는 "
    }
}
