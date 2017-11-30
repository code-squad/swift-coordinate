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

extension MyLine: MyShape, Equatable {
    
    func getMyPoints() -> [MyPoint] {
        let myPoints = [MyPoint(x: pointA.x, y: pointA.y),
                        MyPoint(x: pointB.x, y: pointB.y)]
        return myPoints
    }
    
    func inValidShape() -> Bool {
        if pointA == pointB {
            return true
        } else {
            return false
        }
    }

    func printPoints() {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointA.y, col: (pointA.x * 2) + 3))\(ANSICode.text.dot)")
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - pointB.y, col: (pointB.x * 2) + 3))\(ANSICode.text.dot)")
    }

    func calculate() -> Double {
        let subtractX = (pointA.x - pointB.x).magnitude
        let subtractY = (pointA.y - pointB.y).magnitude
        let cal = Double(subtractX^2 + subtractY^2)
        let distance = sqrt(cal)
        return distance
    }

    func messageByShape() -> String {
        return "두 점 사이의 거리는? -> "
    }
    
    static func == (lineA: MyLine, lineB: MyLine) -> Bool {
        return (lineA.pointA == lineB.pointA && lineA.pointB == lineB.pointB)
    }
}
