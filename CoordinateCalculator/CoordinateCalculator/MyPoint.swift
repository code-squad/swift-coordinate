//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
}

extension MyPoint: MyShape, Equatable {
    func inValidShape() -> Bool {
        return false
    }
    
   func calculate() -> Double {
        return 0.0
    }
    
    func printPoints() {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - y, col: (x * 2) + 3))\(ANSICode.text.dot)")
    }
    
    func messageByShape() -> String {
        return "< 입력한 좌표점 : (\(x),\(y)) >"
    }
    
    static func == (pointA: MyPoint, pointB: MyPoint) -> Bool {
        return (pointA.x == pointB.x && pointA.y == pointB.y)
    }
}

