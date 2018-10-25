//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Shape{
    private(set) var pointA : MyPoint
    private(set) var pointB : MyPoint
    
    init(_ pointA: MyPoint, _ pointB: MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }

    // Line의 길이 계산
    func calculateDistance() -> Double{
        return sqrt(pow((pointA.xPosition-pointB.xPosition), 2) + pow((pointA.yPosition-pointB.yPosition), 2))
    }
    
    // Shape 프로토콜의 메소드를 구현한 메소드 화면상에 좌표를 그려준다
    func drawShape() {
        print("\(ANSICode.cursor.move(row: Int(25-pointA.yPosition), col: Int(2+2*pointA.xPosition)))*")
        print("\(ANSICode.cursor.move(row: Int(25-pointB.yPosition), col: Int(2+2*pointB.xPosition)))*")
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
        print("두 점 사이의 거리는 \(calculateDistance())")
    }
}
