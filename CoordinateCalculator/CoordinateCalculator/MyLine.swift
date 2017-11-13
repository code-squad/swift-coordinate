//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: MyShape {
    var type: Figure
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)

    init(pointA: MyPoint, pointB: MyPoint) {
        self.type = Figure.line
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func calculatorOfPosition() -> String {
        return "\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointA.y, col: (pointA.x * 2) + 3))\(ANSICode.text.dot)\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointB.y, col: (pointB.x * 2) + 3))\(ANSICode.text.dot)"
    }
    
    func printValueOfResult() {
        let result = sqrt(abs(pow(Double(pointA.x - pointB.x),2) + pow(Double(pointA.y - pointB.y),2)))
        print("\(ANSICode.cursor.move(row: 30, col: -1))\(ANSICode.text.black)  두 점 사이 거리는 \(result)")
    }
}
