//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Figure, FigureCalculatable {

    var myPoints: [MyPoint]
    
    var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
        self.myPoints = [pointA, pointB, pointC]
    }
    
    init(_ myPoints: [MyPoint]) {
        self.init(pointA: myPoints[0], pointB: myPoints[1], pointC: myPoints[2])
    }
    
    func calculateDistance() -> Double {
        // 삼각형 넓이 구하기
        return 0.0
    }
    
    func printDistance() {
        print("삼각형 넓이는 \(self.calculateDistance())")
    }
}

